//
//  iniciarSesionViewController.swift
//  iOS-Snapchat
//
//  Created by Josimar on 6/7/19.
//  Copyright © 2019 Josimar. All rights reserved.
//

import UIKit
import Firebase

class iniciarSesionViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            print("Intenamos iniciar sesion")
            if error != nil {
                print("Tenemos el siguiente error:\(error)")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
                    print("Intentamos crear un ususario")
                    if error != nil {
                        print("Tenemos el siguiente error: \(error)")
                    } else {
                        print("Usuario creado exitosamente")
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            } else {
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
            
        })
    }
    
}

