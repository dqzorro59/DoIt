//
//  CreateTasksViewController.swift
//  DoIt
//
//  Created by Dennis Quinones2 on 1/4/17.
//  Copyright © 2017 Dennis Quinones. All rights reserved.
//

import UIKit

class CreateTasksViewController: UIViewController {

    //var previousVC = ViewController()
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
        // Create task from outlet information
        
        // Context is for Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = taskNameTextField.text!
        task.critical = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Removed due to Core Data
        // previousVC.tasks.append(task)
        // previousVC.tableView.reloadData()
        
        // Pop Back
        navigationController!.popViewController(animated: true)
        
    }
    

}
