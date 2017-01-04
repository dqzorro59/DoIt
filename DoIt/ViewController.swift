//
//  ViewController.swift
//  DoIt
//
//  Created by Dennis Quinones2 on 1/4/17.
//  Copyright © 2017 Dennis Quinones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = createTasks()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let localTask = tasks[indexPath.row]
        
        if localTask.critical {
            cell.textLabel?.text = "❗️\(localTask.name)"
        } else {
            cell.textLabel?.text = localTask.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        let localTask = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSeque", sender: localTask)
        
    }
    
    func createTasks() -> [Task] {
        
        let task1 = Task()
        task1.name = "Get Haircut"
        task1.critical = true
        
        let task2 = Task()
        task2.name = "Go to Market"
        task2.critical = false
        
        let task3 = Task()
        task3.name = "Paint House"
        task3.critical = false
        
        return [task1, task2, task3]
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTasksViewController
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSeque" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
}

