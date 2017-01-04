//
//  CreateTasksViewController.swift
//  DoIt
//
//  Created by Dennis Quinones2 on 1/4/17.
//  Copyright © 2017 Dennis Quinones. All rights reserved.
//

import UIKit

class CreateTasksViewController: UIViewController {

    var previousVC = ViewController()
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
        // Create task from outlet information
        
        let task = Task()
        
        task.name = taskNameTextField.text!
        task.critical = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    

}
