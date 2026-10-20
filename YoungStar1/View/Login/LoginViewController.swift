//
//  LoginViewController.swift
//  YoungStar1
//
//  Created by Facultad de Contaduría y Administración on 29/09/26.
//

import UIKit

final class LoginViewController: UIViewController, LoginView {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailErrorLabel: UILabel!
    @IBOutlet private weak var passwordErrorLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!

    private let presenter: LoginPresenter

    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: "LoginViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self

        emailTextField.addTarget(
            self,
            action: #selector(fieldsDidChange),
            for: .editingChanged
        )

        passwordTextField.addTarget(
            self,
            action: #selector(fieldsDidChange),
            for: .editingChanged
        )

        fieldsDidChange()
    }

    @objc private func fieldsDidChange() {
        presenter.fieldsDidChange(
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }

    func showEmailError(message: String?) {
        emailErrorLabel.text = message
        emailErrorLabel.isHidden = message == nil
    }

    func showPasswordError(message: String?) {
        passwordErrorLabel.text = message
        passwordErrorLabel.isHidden = message == nil
    }

    func setLoginButtonEnabled(_ enabled: Bool) {
        loginButton.isEnabled = enabled
    }
}
        // Do any additional setup after loading the view.
    





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selecte object to the new view controller.
    }
    */


