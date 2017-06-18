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
        
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        todoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
        cell.textLabel?.text = "🚩\(task.name!)"
        }else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as![Task]
//            print(tasks)
        }catch {
            print("Error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTask"{
            let nextVC = segue.destination as! CompleteVC
            nextVC.task = sender as? Task

        }

    }
}
