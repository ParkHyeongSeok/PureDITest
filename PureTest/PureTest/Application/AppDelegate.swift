//
//  AppDelegate.swift
//  PureTest
//
//  Created by 박형석 on 2022/02/11.
//

import UIKit

// CompositionRoot : 모든 디팬던시가 구현 - Pure
// Asssembly: Swinject



@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let dependency: AppDependency
    
    // Called Frome the system
    private override init() {
        self.dependency = AppDependency.resolved()
        super.init()
    }
    
    // Called For Test
    init(dependency: AppDependency) {
        self.dependency = dependency
        super.init()
    }
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = dependency.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

