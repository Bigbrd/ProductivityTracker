//
//  LoginViewController.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 3/26/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import UIKit
import AWSMobileClient  //auth imports
import AWSAuthCore
import AWSAuthUI

class LoginViewController: UIViewController {

    @IBOutlet weak var signInStateLabel: UILabel!
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
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
