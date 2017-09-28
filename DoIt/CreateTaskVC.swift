//
//  CreateTaskVC.swift
//  DoIt
//
//  Created by BAM on 2017-09-27.
//  Copyright © 2017 BAM. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addTaskTapped(_ sender: Any) {
        //Adds task to taskList in previous VC
        let newTask = Task()
        newTask.name = nameField.text
        newTask.isImportant = importantSwitch.isOn
        
        print("\(newTask.name!), \(newTask.isImportant!)")
        
        previousVC.taskList.append(newTask)
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
        
    }

}
