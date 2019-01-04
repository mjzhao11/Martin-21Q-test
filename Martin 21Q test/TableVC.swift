//
//  tableVC.swift
//  Martin 21Q test
//
//  Created by Martin Zhao on 2018-12-23.
//  Copyright © 2018 Martin Zhao. All rights reserved.
//

import UIKit
import Firebase

var db: Firestore!



class TableVC: UIViewController{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //users.count()
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        
        //cell.textLabel.text = users[indexPath.row].name
        cell.textLabel!.text = "cell test"
        
        return (cell)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        addAnna()
        addBob()
        addDoug()
        addFred()
        addGina()
        addClint()
        addEmily()
        addHelen()
        
        nonPrivate()
    }
    func f1(){
        print("something")
    }
    
    private func addAnna() {
        // [START add_Anna]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Anna",
            "Occupation": "Cook",
            "private": false
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
       
    }
    
    private func addBob() {
        // [START add_Bob]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Bob",
            "Occupation": "Teacher",
            "private": false
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
      
    }
    
    private func addClint() {
        // [START add_Clint]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Clint",
            "Occupation": "Barista",
            "private": true
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
      
    }
    private func addDoug() {
        // [START add_Doug]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Doug",
            "Occupation": "Wine taster",
            "private": true
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    private func addEmily() {
        // [START add_Emily]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Emily",
            "Occupation": "Musician",
            "private": false
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    private func addFred() {
        // [START add_Fred]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Fred",
            "Occupation": "Student",
            "private": false
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    private func addGina() {
        // [START add_Gina]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Gina",
            "Occupation": "Pilot",
            "private": false
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    private func addHelen() {
        // [START add_Helen]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "Helen",
            "Occupation": "Retailer",
            "private": true
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    private func getCollection() {
        // [START get_collection]
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        // [END get_collection]
    }
    private func nonPrivate() {
       
        let capitalCities = db.collection("cities").whereField("private", isEqualTo: false)
       
        print(capitalCities)
    }
    
}

