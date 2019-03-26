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
// slider input. add a cool rotating slider
// constraints and shit for all devices. rotation. etc. bugs.

import UIKit
import Charts
import RealmSwift
import HGCircularSlider

class ResultsChartViewController: UIViewController {

    // charts
    @IBOutlet weak var resultScatterChartView: ScatterChartView!
    // this is for the X axis
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    // input
    @IBOutlet weak var tfValue: UITextField!

    // slider
    @IBOutlet weak var circularSlider: CircularSlider!
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        axisFormatDelegate = self
        
        // Do any additional setup after loading the view.
        updateChartWithData()
        
        circularSlider.endPointValue = 1
        updateTexts()
        circularSlider.addTarget(self, action: #selector(updateTexts), for: .valueChanged)
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
    // if value value is not empty, save the value of the text box (TODO:switch to slider), when the add button is pressed and clear the textbox. then update the chart
    @IBAction func addButtonTapped(_ sender: Any) {
        if let value = tfValue.text , value != "" {
            let healthData = HealthData()
            healthData.count = (NumberFormatter().number(from: value)?.intValue)!
            healthData.save()
            tfValue.text = ""
        }
        updateChartWithData()
    }
    
    // slider input
    @objc func updateTexts() {
        let value = circularSlider.endPointValue
        let ok = (circularSlider.maximumValue  / CGFloat(circularSlider.numberOfRounds))
        let ff = ceil(value / ok)
        
        maxValueLabel.text = String(format: "%.0f", circularSlider.maximumValue)
        minValueLabel.text = String(format: "%.0f", circularSlider.minimumValue)
        
        currentValueLabel.text = String(format: "%.0f", value)
        roundsLabel.text = "Round N° " +  String(format: "%.0f", ff)
    }
    //not sure if needed, but adding because it was with all sliders
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
