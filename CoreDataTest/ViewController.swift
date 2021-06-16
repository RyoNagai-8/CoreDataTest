//
//  ViewController.swift
//  CoreDataTest
//
//  Created by RyoNagai on 2021/06/06.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var ageText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func create(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let age = Int(ageText.text ?? "0")
        
    }
    
    @IBAction func read(_ sender: Any) {
    }
    @IBAction func update(_ sender: Any) {
    }
    @IBAction func deleteButton(_ sender: Any) {
    }
    
}

