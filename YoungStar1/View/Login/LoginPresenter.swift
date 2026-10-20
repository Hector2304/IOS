//
//  LoginPresenter.swift
//  YoungStar1
//

import Foundation

protocol LoginView: AnyObject {
    func showEmailError(message: String?)
    func showPasswordError(message: String?)
    func setLoginButtonEnabled(_ enabled: Bool)
}

final class LoginPresenter {
    weak var view: LoginView?

    private let onLoginSuccess: () -> Void
    private let validator: LoginValidatorProtocol

    init(
        onLoginSuccess: @escaping () -> Void,
        validator: LoginValidatorProtocol
    ) {
        self.onLoginSuccess = onLoginSuccess
        self.validator = validator
    }

    func emailDidEndEditing(_ email: String) {
        view?.showEmailError(
            message: validator.validateEmail(email)?.message
        )
    }

    func passwordDidEndEditing(_ password: String) {
        view?.showPasswordError(
            message: validator.validatePassword(password)?.message
        )
    }

    func fieldsDidChange(email: String, password: String) {
        let isFormValid =
            validator.validateEmail(email) == nil &&
            validator.validatePassword(password) == nil

        view?.setLoginButtonEnabled(isFormValid)
    }
}
