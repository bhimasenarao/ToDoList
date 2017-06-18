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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.important {
            taskLable.text = "🚩\(task!.name!)"
        }else {
            taskLable.text = task!.name
        }
        
        taskLable.text = task!.name!
    }


    @IBAction func completeTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
   }
