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
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addTaskTapped(_ sender: Any) {
        //Adds task to taskList in previous VC
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newTask = Task(context: context)
        newTask.name = nameField.text
        newTask.isImportant = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        print("\(newTask.name!), \(newTask.isImportant)")

        navigationController?.popViewController(animated: true)
        
    }

}
