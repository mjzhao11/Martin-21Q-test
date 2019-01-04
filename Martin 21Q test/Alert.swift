//
//  Alert.swift
//  Martin 21Q test
//
//  Created by Martin Zhao on 2018-12-23.
//  Copyright © 2018 Martin Zhao. All rights reserved.
//

import UIKit

class Alert{
    
    static func showAlert(_inViewController: UIViewController, title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )
        let action = UIAlertAction(title:"OKAY", style: .default, handler: nil)
        alert.addAction(action)
        _inViewController.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    
}
