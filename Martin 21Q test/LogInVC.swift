//
//  ViewController.swift
//  Martin 21Q test
//
//  Created by Martin Zhao on 2018-12-23.
//  Copyright © 2018 Martin Zhao. All rights reserved.
//

import UIKit
import Firebase


class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func logInTP(_ sender: Any) {
        
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else{
                Alert.showAlert(_inViewController: self, title: "Missing information!", message: "Please use the demo account:\n mjzhao11@ymail.com \n password: martin123")
                return
            }
        Auth.auth().signIn(withEmail: email, password: password, completion:{(user,error) in
            guard error == nil else{
                Alert.showAlert(_inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else{return}
            print(user.additionalUserInfo ?? "Missing email")
            self.performSegue(withIdentifier: "LogInSeg", sender: nil)
        })
    }
}

