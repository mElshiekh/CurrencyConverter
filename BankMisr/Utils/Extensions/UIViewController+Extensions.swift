//
//  UIViewController+Extensions.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import UIKit

extension UIViewController {
    public static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
