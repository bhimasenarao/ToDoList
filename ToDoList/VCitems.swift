//
//  VCitems.swift
//  ToDoList
//
//  Created by Bhimasena Patri on 13/6/2017.
//  Copyright © 2017 Bhimasena Patri. All rights reserved.
//

import UIKit

class VCitems: UIViewController {

    @IBOutlet var itemNameLable: UILabel!
    
    @IBOutlet var itemTextyField: UITextField!
    
    @IBOutlet var impSwitch: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = itemTextyField.text!
        task.important = impSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
 
        navigationController!.popViewController(animated: true)
    }
}
