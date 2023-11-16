//
//  CustomAlert.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import UIKit

class CustomAlert {
    func showAlert(parentController: UIViewController, message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        parentController.present(alertController, animated: true, completion: nil)
    }
}
