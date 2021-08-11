//
//  ViewController.swift
//  CoreDataTest
//
//  Created by RyoNagai on 2021/06/06.
//　テストで記入

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
        
        if let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context),
           let age = Int(ageText.text ?? "")
           {
            let personObject = NSManagedObject(entity: entity, insertInto: context)
            personObject.setValue(name.text, forKey: "name")
            personObject.setValue(age, forKey: "age")
            do{
                try context.save()
                print("Success")
            }catch{
                print("Error:\(error)")
            }
        }
        
        
        
        
    }
    
    @IBAction func read(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
        do {
        let results = try context.fetch(fetchRequest)
            for data in results{
                if let name = data.value(forKey: "name") as? String,
                   let age = data.value(forKey: "age") as? Int{
                    print("name = \(name), age = \(String(age))")
                }
            }
        } catch {
            print("Error:\(error)")
        }
        
        
    }
    
    
    @IBAction func update(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
        do {
        let results = try context.fetch(fetchRequest)
            for data in results{
                if let name = data.value(forKey: "name") as? String,
                   let age = data.value(forKey: "age") as? Int{
                    data.setValue(name + "*", forKey: "name")
                    data.setValue(age + 1, forKey: "age")
                    try context.save()
                    print("Read succes")
                }
            }
        } catch {
            print("Error:\(error)")
        }
        
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
        fetchRequest.predicate = NSPredicate(format: "name contains[cd] %@", "*")
        
        do {
        let results = try context.fetch(fetchRequest)
            for data in results{
                
                context.delete(data)
                try context.save()
                print("Delete succes")
                
            }
        } catch {
            print("Error:\(error)")
        }
        
        
        
    }
    
}

struct SomeError: Error {}

