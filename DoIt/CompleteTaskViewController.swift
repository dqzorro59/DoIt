//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Dennis Quinones2 on 1/4/17.
//  Copyright © 2017 Dennis Quinones. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task : Task? = nil
    // Removed due to Core Data
    //var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.critical {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
        
    }
    
    @IBAction func completeTapped(_ sender: Any) {
       
        // Removed due to Core Data
      //  previousVC.tasks.remove(at: previousVC.selectedIndex)
     //   previousVC.tableView.reloadData()
        
        // Context is for Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop Back
        navigationController!.popViewController(animated: true)
        
    }
}
