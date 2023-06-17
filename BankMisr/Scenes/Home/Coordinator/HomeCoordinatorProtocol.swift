//
//  HomeCoordinatorProtocol.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import UIKit

protocol HomeCoordinatorProtocol: AnyObject {
    func initialize(model: HomeCoordinatorModelProtocol) -> UIViewController
    func start(window: UIWindow)
    var controller: HomeViewController? { get set }
    var navigationController: UINavigationController? { get set }
}
