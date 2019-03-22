//
//  MealTableViewController.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 2/18/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {
    
    // MARK: properties
    var meals = [Meal]() // empty array of meals

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // use the edit button item provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem

        // load any saved meals, else load default
        if let savedMeals = loadMeals() {
            meals += savedMeals
        }
        else {
            // load the sample meals
            loadSampleMeals()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // fetch the appropriate meal for the data source layout
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            meals.remove(at: indexPath.row)
            saveMeals()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // If the identifier is nil, the nil-coalescing operator (??) replaces it with an empty string ("").
        switch (segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let mealDetailViewController = segue.destination as? MealViewController
                else {
                    fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedMealCell = sender as? MealTableViewCell
                else {
                    fatalError("Unexpected sender: \(sender)")
            }
            guard let indexPath = tableView.indexPath(for: selectedMealCell)
                else {
                    fatalError("The selected cell is not being displayed by the table")
            }
            let selectedMeal = meals[indexPath.row]
            mealDetailViewController.meal = selectedMeal
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    
    // MARK: - Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            
            // if there is a row selected, go into edit mode
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // replace the meal
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // else add a new meal
                let newIndexPath = IndexPath(row: meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            // save the meals!
            saveMeals()
        }
    }
    
    // MARK: private methods
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "Image")
        let photo2 = UIImage(named: "Image-1")
        
        guard let meal1 = Meal(name: "meal1", photo: photo1, rating: 3) else {
            fatalError("Unable to instantiate meal 1")
        }
        guard let meal2 = Meal(name: "meal2", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal 2")
        }
        
        meals += [meal1, meal2]
    }
    
    private func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path)
        //let data = NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
//data.write(to: Meal.ArchiveURL.absoluteURL)
        if isSuccessfulSave {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
        }
        else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadMeals() -> [Meal]? {
        // This method has a return type of an optional array of Meal objects, meaning that it might return an array of Meal objects or might return nothing (nil).
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]

    }

}
