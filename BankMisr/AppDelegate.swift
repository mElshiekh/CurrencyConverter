//
//  AppDelegate.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 16/06/2023.
//

import CoreData
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        start()
        return true
    }

    func start() {
        let navigationController = UINavigationController()
        let coordinator = HomeCoordinator()
        let controller = coordinator.initialize(model: HomeCoordinatorModel(navigationController: navigationController))
        let window = UIWindow()
        self.window = window
        coordinator.start(window: window)
    }
}
