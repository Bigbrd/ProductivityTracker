//
//  AppDelegate.swift
//  ProductivityTracker
//
//  Created by Bryan Dickens on 2/1/19.
//  Copyright © 2019 Bryan Dickens. All rights reserved.
//

import UIKit
import AWSAppSync
import AWSMobileClient  //auth imports

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appSyncClient: AWSAppSyncClient?
    var analyticsService: AnalyticsService?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initializes the api with auth
        initializeAppSync()
        
        // Initialize Pinpoint analytics service
        // analyticsService = LocalAnalyticsService() // this one records events to the debug log
        analyticsService = AWSAnalyticsService()
        
        return true
    }
    
    func initializeAppSync() {
        do {
            // You can choose the directory in which AppSync stores its persistent cache databases
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()
            
            // Initialize the AWS AppSync configuration
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: AWSAppSyncServiceConfig(),
                                                                  userPoolsAuthProvider: {
                                                                    class MyCognitoUserPoolsAuthProvider : AWSCognitoUserPoolsAuthProviderAsync {
                                                                        func getLatestAuthToken(_ callback: @escaping (String?, Error?) -> Void) {
                                                                            AWSMobileClient.sharedInstance().getTokens { (tokens, error) in
                                                                                if error != nil {
                                                                                    callback(nil, error)
                                                                                } else {
                                                                                    callback(tokens?.idToken?.tokenString, nil)
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    return MyCognitoUserPoolsAuthProvider()}(),
                                                                  cacheConfiguration: cacheConfiguration)
            
            // Initialize the AWS AppSync client
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
        } catch {
            print("Error initializing appsync client. \(error)")
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

