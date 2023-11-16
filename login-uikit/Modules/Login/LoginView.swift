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
    @IBOutlet weak var passwordTextfield: CustomTextField!
    @IBOutlet weak var loginButton: CustomButton!
    @IBOutlet weak var haveAccountLabel: UILabel!
    
    var viewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBody()
    }

}

extension LoginView {
    func setupBody() {
        setupView()
        setupDelegate()
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel.delegate = self
    }
    
    func setupView() {
        greetingsLabel.text = "Hai, Selamat Datang"
        greetingsLabel.changeFontStyle(text: "Selamat Datang", fontFamily: "Gilroy-Bold", fontSize: 28)
        haveAccountLabel.text = "Belum punya akun?  Daftar Sekarang"
        haveAccountLabel.changeFontStyle(text: "Daftar Sekarang", fontFamily: "FONTSPRINGDEMO-ProximaNovaBold", fontSize: 14, textColor: CustomColors.color_002060)
        loginAdviceLabel.text = "Silahkan login untuk melanjutkan"
        usernameTextfield.setupView(label: "Email",
                                    placeholder: "Masukkan email anda",
                                    isHideForgotLabel: true,
                                    isHideEyeButton: true)
        passwordTextfield.setupView(label: "Password", placeholder: "Masukkan password anda")
        loginButton.setupView(title: "Login")
    }
    
    func setupDelegate() {
        loginButton.delegate = self
    }
}

extension LoginView: LoginViewModelDelegate {
    func didSuccessLogin() {
        CustomAlert().showAlert(parentController: self, message: "", title: "Log In Success")
    }
    
    func didFailLogin(error: String) {
        CustomAlert().showAlert(parentController: self, message: error, title: "Error")
    }
    
    
}
