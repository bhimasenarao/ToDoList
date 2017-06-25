//
//  CompleteVC.swift
//  ToDoList
//
//  Created by Bhimasena Patri on 18/6/2017.
//  Copyright © 2017 Bhimasena Patri. All rights reserved.
//

import UIKit

class CompleteVC: UIViewController {

    var task : Task? = nil
    
    
    @IBOutlet weak var taskLable: UILabel!
    
    @IBOutlet weak var impSwitch: UISwitch!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var editPressed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//Show the selected cell contents in this view
        if task!.important {
            editTextField.text = "♦️\(task!.name!)"
            impSwitch.setOn(true, animated: true)
        }else {
            editTextField.text = task!.name!
        }
    }

//Completed task will be removed from the tasks list through Coredata
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func editBynPressed(_ sender: Any) {
        _ = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if impSwitch.isOn{
        task?.name = editTextField.text!
            task?.important = true
        }else{
            task?.name = editTextField.text
            task?.important = false
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
    
}
