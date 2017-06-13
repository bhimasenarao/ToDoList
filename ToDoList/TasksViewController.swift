//
//  TasksViewController.swift
//  ToDoList
//
//  Created by Bhimasena Patri on 13/6/2017.
//  Copyright © 2017 Bhimasena Patri. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var todoTableView: UITableView!
    
    var tasks:[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
        cell.textLabel?.text = "🚩\(task.name)"
        }else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "do MongoDB exercise"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Learn iOS"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Do homework"
        task3.important = true
        
        return[task1, task2, task3]
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! VCitems
        nextVC.prevVC = self
    }
}

