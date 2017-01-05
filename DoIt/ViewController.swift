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
    // Removed do to core data
    //var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let localTask = tasks[indexPath.row]
        
        if localTask.critical {
            cell.textLabel?.text = "❗️\(localTask.name!)"
        } else {
            cell.textLabel?.text = localTask.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        let localTask = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSeque", sender: localTask)
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    // Pulling things out of Core DAta
    func getTasks() {
        
        // Context is for Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("Critical Error Exception - Defensive Programming")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Removed due to Core Data
        //     if segue.identifier == "addSegue" {
        //         let nextVC = segue.destination as! CreateTasksViewController
        //         nextVC.previousVC = self
        //     }
        
        if segue.identifier == "selectTaskSeque" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
}

