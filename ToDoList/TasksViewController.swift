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
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
    
//Prepare the todoTableView for the rows and cell values.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
            if task.important {
                cell.textLabel?.text = "♦️\(task.name!)"
            }else {
                cell.textLabel?.text = task.name!
            }
        return cell
    }
    
//Prepare the Segue when a table cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    
//Add button functionality
    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
//Coredata - fetch data for refreshing the table
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as![Task]

        }catch {
            print("Error")
        }
    }
//Refresh todoTableView whenever it appears
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        todoTableView.reloadData()
    }

//Bring up the view when a cell in the table is clicked.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTask"{
            let nextVC = segue.destination as! CompleteVC
            nextVC.task = sender as? Task
        }
    }
}
