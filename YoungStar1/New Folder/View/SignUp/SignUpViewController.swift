//
//  SignUpViewController.swift
//  YoungStar1
//
//  Created by Jorge Arturo Young Medina on 08/10/26.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func togglePasswordVisibility(_ sender: UISwitch) {
        passwordTextField.isSecureTextEntry = !sender.isOn
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
