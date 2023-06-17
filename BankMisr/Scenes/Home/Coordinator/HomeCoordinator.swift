//
//  HomeCoordinator.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import UIKit

class HomeCoordinator: HomeCoordinatorProtocol {
    weak var controller: HomeViewController?
    var navigationController: UINavigationController?
    
    @discardableResult
    func initialize(model: HomeCoordinatorModelProtocol) -> UIViewController {
        navigationController = model.navigationController
        let viewModel = HomeViewModel()
        viewModel.service = CurrencyServices()
        let controller = HomeViewController.loadFromNib()
        self.controller = controller
        controller.coordinator = self
        controller.viewModel = viewModel
        return controller
    }
    
    func start(window: UIWindow) {
        navigationController?.viewControllers = [controller ?? UIViewController()]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func goToDetails() {
    }
}
