//
//  WelcomePresenter.swift
//  YoungStar1
//
//  Created by Facultad de Contaduría y Administración on 13/10/26.
//

import Foundation

final class WelcomePresenter {
    private let onShowLogin: () -> Void
    private let onShowSignUp: () -> Void

    init(
        onShowLogin: @escaping () -> Void,
        onShowSignUp: @escaping () -> Void
    ) {
        self.onShowLogin = onShowLogin
        self.onShowSignUp = onShowSignUp
    }

    func didTapLogin() {
        onShowLogin()
    }

    func didTapRegister() {
        didTapSignUp()
    }

    func didTapSignUp() {
        onShowSignUp()
    }
}

