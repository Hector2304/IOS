//
//  WelcomeViewController.swift
//  YoungStar1
//
//  Created by Facultad de Contaduría y Administración on 08/10/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let presenter:WelcomePresenter
    
    init(presenter: WelcomePresenter) {
            self.presenter = presenter
            super.init(nibName: "WelcomeViewController", bundle: nil)
        }

    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        @IBAction private func loginButtonTapped(_ sender: Any) {
            presenter.didTapLogin()
        }
    
    @IBAction private func registerButtonTapped(_ sender: Any) {
        presenter.didTapRegister()
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
