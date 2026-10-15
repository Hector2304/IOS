//
//  SignUpPresenter.swift
//  YoungStar1
//
//  Created by Jorge Arturo Young Medina on 15/10/26.
//

import Foundation

protocol SignUpView: AnyObject {
    func showError(_ message: String)
}

final class SignUpPresenter {
    weak var view: SignUpView?

    private let onSignUpCompleted: () -> Void
    private let onShowLogin: () -> Void

    init(
        onSignUpCompleted: @escaping () -> Void,
        onShowLogin: @escaping () -> Void
    ) {
        self.onSignUpCompleted = onSignUpCompleted
        self.onShowLogin = onShowLogin
    }

    func didTapSignUp(form: SignUpForm) {
        if let error = form.validationError() {
            view?.showError(error)
            return
        }
        onSignUpCompleted()
    }

    func didTapLogin() {
        onShowLogin()
    }
}
