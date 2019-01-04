//
//  MainVC.swift
//  Martin 21Q test
//
//  Created by Martin Zhao on 2018-12-23.
//  Copyright © 2018 Martin Zhao. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var mainLB: UILabel!
    @IBOutlet weak var myTV: UITableView!
    
    var db: Firestore!
    var usersRef:DatabaseReference!
    var handle:DatabaseHandle!
    
    
    var list = [unit]()
    var list2 = [unit]()
    
    //------------------------------------------------------------ overriding tableView func(s)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return list2.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        let ppl: unit
        
        ppl = list[indexPath.row]
        
        // cell.lb1.text = ppl.name
        // cell.lb2.text = ppl.occupation
        
        return cell
    }
    
    
    
    //--------------------------------------------------- main func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersRef = Database.database().reference()
        
        /*
        let a0 = unit.init(nm: "Anna", ocp: "Cook", pri: false)
        let a1 = unit.init(nm: "Bob", ocp: "Teacher", pri: false)
        let a2 = unit.init(nm: "Emily", ocp: "Musician", pri: false)
        let a3 = unit.init(nm: "Fred", ocp: "Student", pri: false)
        let a4 = unit.init(nm: "Gina", ocp: "Pilot", pri: false)
        list2.insert(a0,at: 0)
        list2.insert(a1,at: 1)
        list2.insert(a2,at: 2)
        list2.insert(a3,at: 3)
        list2.insert(a4,at: 4)
       
        */
        
        //FirebaseApp.configure() // already done in logInVC
        
        db = Firestore.firestore()
        
        usersRef = Database.database().reference().child("users");
        
        
        /*
        usersRef.observe(DataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount>0{
                self.list.removeAll()
                for ppl in snapshot.children.allObjects as![DataSnapshot]{
                    let unitObj = ppl.value as? [String: AnyObject]
                    let name_ = unitObj?["Name"]
                    let occupation_  = unitObj?["Occupation"]
                    
                    let obj = unit(nm: name_ as! String?, ocp: occupation_ as! String?, pri: true)
                    self.list.append(obj)
                }
                self.myTV.reloadData()
            }
 
        })
        
      */
    }
    //-------------------------------------------back to first page
    @IBAction func logOutTP(_ sender: Any) {
    }
   
        //--------------------------------------test button will call adding documents
    @IBAction func testTP(_ sender: Any) {
        usersRef = Database.database().reference()
        
        
        //--------------------------------------commented out: only need to run once
       /*
        addAnna()
        addBob()
        
        addDoug()
        addFred()
        addGina()
        addClint()
        addEmily()
        addHelen()
        
       */

        printInCon()
    }
    

    
    //------------------------------------------------- adding 8 documents
    
    private func addAnna() {
        
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
        
    }
    
    private func printInCon(){
        db.collection("users").whereField("private", isEqualTo: false).addSnapshotListener{ querySnapshot, error in
            guard let snapshot = querySnapshot else{
                print("Error in snapshots\(String(describing: error))")
                return
            }
            print("Current users are non-private ones:\(snapshot.documents.map{ $0.data() })")
        }
    }
   
    
    
    
    
}
