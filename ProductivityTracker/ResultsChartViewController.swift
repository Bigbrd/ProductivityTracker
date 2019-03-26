//
//  ResultsChartViewController.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 3/22/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//
// TODOs:
// chart = remove data. have X axis on bottom, allow to configure day/week/month/24hrs. scroll horizontally. lock Y axis from 1 to 10
// realm = load/save data.. other realm shit. create the whole "more than you, get data from everyone thing
// signin = eureka form fill / account creation etc.
// slider input = change colors when sliding?? fancier?
// constraints and shit for all devices. rotation. etc. bugs.

import UIKit
import Charts
import RealmSwift

class ResultsChartViewController: UIViewController {

    // charts
    @IBOutlet weak var resultScatterChartView: ScatterChartView!
    // this is for the X axis
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    // input slider
    @IBOutlet weak var inputSlider: PRGRoundSlider!
    let sliderStartValue:CGFloat = 0.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        axisFormatDelegate = self
        
        // Do any additional setup after loading the view.
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
        let healthData = HealthData()
        healthData.count = Int(inputSlider.value*100)
        healthData.save()
        inputSlider.value = sliderStartValue
        
        updateChartWithData()
    }
    
    // chart function that gets all data from database and creates the chart
    func updateChartWithData() {
        var dataEntries: [ChartDataEntry] = []
        let healthData = getHealthDataFromDatabase()
        for i in 0..<healthData.count {
            // set the values here (TODO:switch i to date)
            let timeIntervalForDate: TimeInterval = healthData[i].date.timeIntervalSince1970
            let dataEntry = ChartDataEntry(x: Double(timeIntervalForDate), y: Double(healthData[i].count))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = ScatterChartDataSet(values: dataEntries, label: "Health data")
        let chartData = ScatterChartData(dataSet: chartDataSet)
        resultScatterChartView.data = chartData
        
        let xaxis = resultScatterChartView.xAxis
        xaxis.valueFormatter = axisFormatDelegate
    }
    
    // database function that gets data from database
    func getHealthDataFromDatabase() -> Results<HealthData> {
        do {
            let realm = try Realm()
            return realm.objects(HealthData.self)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
}

// MARK: axisFormatDelegate
extension UIViewController: IAxisValueFormatter {
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}
