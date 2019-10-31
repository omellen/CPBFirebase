//
//  SecondViewController.swift
//  CPBFirebase
//
//  Created by Olivia Mellen on 10/28/19.
//  Copyright © 2019 Olivia Mellen. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numOfStuTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    var arrayOf: ArrayOf!
    var names = String()
    var location = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func whenSavePressed(_ sender: Any) {
        
        names = nameTextField.text!
        location = locationTextField.text!
        
        arrayOf.names.append(names)
        arrayOf.location.append(location)
    }
    
    func updateCloud() {
        let collegeDatabase = Database.database().reference().child("colleges")
        collegeDatabase.child(names).value(forKey: location)

    }
   override func viewDidDisappear(_ animated: Bool) {
        
        
        updateCloud()
    }
    
}
