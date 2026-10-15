import UIKit

final class SignUpViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var termsSwitch: UISwitch!

    private let presenter: SignUpPresenter

    init(presenter: SignUpPresenter) {
        self.presenter = presenter
        super.init(nibName: "SignUpViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        birthDatePicker.maximumDate = Date()

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func togglePasswordVisibility(_ sender: UISwitch) {
        passwordTextField.isSecureTextEntry = !sender.isOn
        confirmPasswordTextField.isSecureTextEntry = !sender.isOn
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        view.endEditing(true)
        let form = SignUpForm(
            firstName: firstNameTextField.text ?? "",
            lastName: lastNameTextField.text ?? "",
            username: usernameTextField.text ?? "",
            email: emailTextField.text ?? "",
            phone: phoneTextField.text ?? "",
            birthDate: birthDatePicker.date,
            password: passwordTextField.text ?? "",
            confirmPassword: confirmPasswordTextField.text ?? "",
            acceptedTerms: termsSwitch.isOn
        )
        presenter.didTapSignUp(form: form)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        presenter.didTapLogin()
    }
}

extension SignUpViewController: SignUpView {
    func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Revisa tus datos",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
