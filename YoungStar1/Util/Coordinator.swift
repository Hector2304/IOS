import UIKit

final class AppCoordinator {
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory

    init(
        navigationController: UINavigationController,
        factory: ViewControllerFactory
    ) {
        self.navigationController = navigationController
        self.factory = factory
    }

    func start() {
        let viewController = factory.makeWelcomeViewController(
            onShowLogin: { [weak self] in
                self?.showLogin()
            },
            onShowSignUp: { [weak self] in
                self?.showSignUp()
            }
        )

        navigationController.viewControllers = [viewController]
    }

    private func showLogin() {
        let viewController = factory.makeLoginViewController(
            onLoginSuccess: {
                // Pendiente: navegar después de iniciar sesión.
            }
        )

        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }

    private func showSignUp() {
        let viewController = factory.makeSignUpViewController(
            onSignUpCompleted: {
                // Pendiente: abrir la pantalla de datos personales.
            },
            onShowLogin: { [weak self] in
                self?.showLogin()
            }
        )

        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}

protocol ViewControllerFactory {
    func makeWelcomeViewController(
        onShowLogin: @escaping () -> Void,
        onShowSignUp: @escaping () -> Void
    ) -> UIViewController

    func makeLoginViewController(
        onLoginSuccess: @escaping () -> Void
    ) -> UIViewController

    func makeSignUpViewController(
        onSignUpCompleted: @escaping () -> Void,
        onShowLogin: @escaping () -> Void
    ) -> UIViewController
}

final class AppDIContainer: ViewControllerFactory {
    func makeWelcomeViewController(
        onShowLogin: @escaping () -> Void,
        onShowSignUp: @escaping () -> Void
    ) -> UIViewController {
        let presenter = WelcomePresenter(
            onShowLogin: onShowLogin,
            onShowSignUp: onShowSignUp
        )

        return WelcomeViewController(presenter: presenter)
    }

    func makeLoginViewController(
        onLoginSuccess: @escaping () -> Void
    ) -> UIViewController {
        let presenter = LoginPresenter(
            onLoginSuccess: onLoginSuccess,
            validator: LoginValidator()
        )
        return LoginViewController(presenter: presenter)
    }

    func makeSignUpViewController(
        onSignUpCompleted: @escaping () -> Void,
        onShowLogin: @escaping () -> Void
    ) -> UIViewController {
        let presenter = SignUpPresenter(
            onSignUpCompleted: onSignUpCompleted,
            onShowLogin: onShowLogin
        )

        let viewController = SignUpViewController(
            presenter: presenter
        )

        presenter.view = viewController
        return viewController
    }
}
