//
//  TaskInfoVC.swift
//  DoIt
//
//  Created by BAM on 2017-09-27.
//  Copyright © 2017 BAM. All rights reserved.
//

import UIKit

class TaskInfoVC: UIViewController {
    
    // would be much easier to swipe on a cell to delete/complete. 

    var task = Task()
    var tasksVC = TasksViewController()
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.isImportant {
            taskLabel.text = "Task: ❗️" + task.name
        } else {
            taskLabel.text = "Task: \(task.name!)"
        }

    }

    @IBAction func completePressed(_ sender: Any) {
        tasksVC.taskList.remove(at: tasksVC.selectedIndex)
        tasksVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
