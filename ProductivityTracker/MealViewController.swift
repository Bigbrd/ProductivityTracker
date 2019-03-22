//
//  ViewController.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 2/1/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var productivityLevelLabel: UILabel!
    @IBOutlet weak var productivityLevelSlider: UISlider!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text fields input through text field delegate callbacks
        nameTextField.delegate = self
        // Set up views if editing an existing Meal.
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
        
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // process the text
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // disable the save button while editing
        saveButton.isEnabled = false
    }

    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss the picker if they cancelled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // info dictionary contains multiple versions of image, we want original
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImageView.image = selectedImage
        // then dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // depending on the style of segue (modal or push presentation), needs to be dismissed 2 different ways
        let isPresentingInAddMealMode = presentingViewController is UINavigationController //bool value of is it this type
        if isPresentingInAddMealMode {
            //is true, adding meal
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController {
            //  pops the current view controller (the meal detail scene) off the navigation stack and animates the transition.
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    // this method lets you configure a view controller before its presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // configure the destination view controller only when the save is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        // set the meal to be passed to the meal table view controller after the unwind segue
        meal = Meal(name: name, photo: photo, rating: rating)
        
    }
    
    
    // MARK: Actions
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        mealNameLabel.text = "Default Text"
//        productivityLevelSlider.value = 3
//    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImageController to pick the image
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        
        // notify when the user selects an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    private func updateSaveButtonState(){
        // disable the save button when the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

