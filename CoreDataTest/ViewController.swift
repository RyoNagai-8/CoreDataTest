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
    @IBOutlet weak var age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func create(_ sender: Any) {
         //let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    @IBAction func read(_ sender: Any) {
    }
    @IBAction func update(_ sender: Any) {
    }
    @IBAction func deleteButton(_ sender: Any) {
    }
    
}

