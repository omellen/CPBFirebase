//
//  ViewController.swift
//  CPBFirebase
//
//  Created by Olivia Mellen on 10/24/19.
//  Copyright © 2019 Olivia Mellen. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOf = ArrayOf()
    var names = String()
    var location = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getColleges()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOf.names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = "\(arrayOf.names[indexPath.row])"
        cell.detailTextLabel?.text = "\(arrayOf.location[indexPath.row])"
        return cell
    }
    
    func getColleges() {
        arrayOf.names = []
        arrayOf.location = []
       
        
        let nameReference = Database.database().reference().child("colleges")
        nameReference.observe(.value) { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let name = data.key
                let locationName = data.value as! String
                self.arrayOf.names.append(name)
                self.arrayOf.location.append(locationName)
            }
            self.tableView.reloadData()
        }
        
        self.tableView.reloadData()
    }
     
    
    
    
}

