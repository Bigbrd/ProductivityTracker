//
//  ResultsChartViewController.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 3/22/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//
// TODOs:
// chart = remove data. have X axis on bottom, allow to configure day/week/month/24hrs. scroll horizontally. lock Y axis from 1 to 10
// delete data points. go into a specifc point
// Need to validate if you make a separate account you dont see other peoples data. then theres a toggle to see more than you, get data from everyone thing.
// file storage
// push notifications

// AWS = signin. i did bare bones, but lots of more stuff to do here... https://aws-amplify.github.io/docs/ios/authentication
// low - AWS Pinpoint can log more things https://aws-amplify.github.io/docs/ios/analytics
// low - serverless api - meh, did it mainly. this would just be if I wanted custom functions now
// low - slider input styling change colors when sliding?? fancier?
// constraints and shit for all devices. rotation. etc. bugs.

import UIKit
import Charts
import AWSAppSync
import AWSMobileClient  //auth imports
import AWSAuthCore
import AWSAuthUI

class ResultsChartViewController: UIViewController {

    // charts
    @IBOutlet weak var resultScatterChartView: ScatterChartView!
    // this is for the X axis
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    // input slider
    @IBOutlet weak var inputSlider: PRGRoundSlider!
    let sliderStartValue:CGFloat = 0.5
    
    // sign in label
    @IBOutlet weak var signInStateLabel: UILabel!
    
    //Reference AppSync client
    var appSyncClient: AWSAppSyncClient?
    // reference the analytics for logging
    var analyticsService: AnalyticsService? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AWS login
        AWSMobileClient.sharedInstance().initialize { (userState, error) in
            if let userState = userState {
                switch(userState){
                case .signedIn:
                    DispatchQueue.main.async {
                        self.signInStateLabel.text = "Logged In"
                    }
                case .signedOut:
                    AWSMobileClient.sharedInstance().showSignIn(navigationController: self.navigationController!, { (userState, error) in
                        if(error == nil){       //Successful signin
                            DispatchQueue.main.async {
                                self.signInStateLabel.text = "Logged In"
                            }
                        }
                    })
                default:
                    AWSMobileClient.sharedInstance().signOut()
                }
                
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        // Get a reference to the analytics service from the AppDelegate
        analyticsService = (UIApplication.shared.delegate as! AppDelegate).analyticsService
        
        // Instantiate sign-in UI from the SDK library
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(
                with: self.navigationController!,
                configuration: nil,
                completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                    if error != nil {
                        self.analyticsService?.recordEvent("_userauth.auth_fail",
                                                           parameters: ["message":String(describing:error)], metrics: nil)
                    } else {
                        self.analyticsService?.recordEvent("_userauth.sign_in",
                                                           parameters: ["userid":AWSIdentityManager.default().identityId!], metrics: nil)
                    }
            }
            )
        }
        
        // AWS setup AppSync
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
        
        // chart setup
        axisFormatDelegate = self
        updateChartWithData()
        
        // setupSlider customized message
        inputSlider.messageForValue = { (value) in
            return "\(Int(value*100))%"
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Actions
    // save the value of the slider when the add button is pressed and reset the slider. then update the chart
    @IBAction func addButtonTapped(_ sender: Any) {
//        let healthData = HealthData()
//        healthData.count = Int(inputSlider.value*100)
//        healthData.save()
        runMutation()
//        inputSlider.value = sliderStartValue
        
//        updateChartWithData()
    }
    
    // chart function that gets all data from database and creates the chart
    func updateChartWithData() {
        var dataEntries: [ChartDataEntry] = []
        var healthData: [ListHealthDatasQuery.Data.ListHealthData.Item?] = []
        
        // run query here to get the data
        appSyncClient?.fetch(query: ListHealthDatasQuery(), cachePolicy: .returnCacheDataAndFetch) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            healthData = (result?.data?.listHealthDatas?.items)!
            for i in 0..<healthData.count {
                // convert string to date
                let dateValue = healthData[i]!.datetime
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                //according to date format your date string
                guard let dateFormattedValue = dateFormatter.date(from: dateValue) else {
                    fatalError()
                }
                let timeIntervalForDate: TimeInterval = dateFormattedValue.timeIntervalSince1970
                let dataEntry = ChartDataEntry(x: Double(timeIntervalForDate), y: Double(healthData[i]!.value))
                dataEntries.append(dataEntry)
            }
            let chartDataSet = ScatterChartDataSet(values: dataEntries, label: "Health data")
            let chartData = ScatterChartData(dataSet: chartDataSet)
            self.resultScatterChartView.data = chartData
            
            let xaxis = self.resultScatterChartView.xAxis
            xaxis.valueFormatter = self.axisFormatDelegate
        }
        
    }
    
    // aws db functions
    // Call the runMutation(), runQuery(), and subscribe() methods from your app code, such as from a button click or when your app starts in viewDidLoad(). You will see data being stored and retrieved in your backend from the Xcode console
    func runMutation(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let now = dateFormatter.string(from: NSDate() as Date)
        
        let mutationInput = CreateHealthDataInput(datetime: now, value: Int(inputSlider.value*100))
        appSyncClient?.perform(mutation: CreateHealthDataMutation(input: mutationInput)) { [weak self] (result, error) in
            // ... do whatever error checking or processing you wish here
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            self?.inputSlider.value = (self?.sliderStartValue)!
            self?.updateChartWithData()
        }
    }

//    var discard: Cancellable?
//    func subscribe() {
//        do {
//            discard = try appSyncClient?.subscribe(subscription: OnCreateHealthDataSubscription(), resultHandler: { (result, transaction, error) in
//                if let result = result {
//                    print(result.data!.onCreateHealthData!.datetime + " " + String(result.data!.onCreateHealthData!.value))
//                } else if let error = error {
//                    print(error.localizedDescription)
//                }
//            })
//        } catch {
//            print("Error starting subscription.")
//        }
//    }
    
}

// MARK: axisFormatDelegate
extension UIViewController: IAxisValueFormatter {
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}
