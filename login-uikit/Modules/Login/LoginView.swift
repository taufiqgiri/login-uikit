//
//  LoginView.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 15/11/23.
//

import UIKit

class LoginView: UIViewController {
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var loginAdviceLabel: UILabel!
    @IBOutlet weak var usernameTextfield: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBody()
    }

}

extension LoginView {
    func setupBody() {
        setupView()
    }
    
    func setupView() {
        greetingsLabel.text = "Hai, Selamat Datang"
        loginAdviceLabel.text = "Silahkan login untuk melanjutkan"
        usernameTextfield.setupView(label: "Email",
                                    placeholder: "Masukkan email anda",
                                    isHideForgotLabel: true,
                                    isHideEyeButton: true)
    }
}
