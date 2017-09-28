//
//  ViewController.swift
//  DoIt
//
//  Created by BAM on 2017-09-27.
//  Copyright © 2017 BAM. All rights reserved..
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var taskList : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskList = createTasks()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTasks() -> [Task] {
        var tasks = [Task]()
        
        let task1 = Task()
        task1.name = "Go to the gym"
        task1.isImportant = true
        tasks.append(task1)
        
        let task2 = Task()
        task2.name = "Groceries"
        task2.isImportant = false
        tasks.append(task2)

        let task3 = Task()
        task3.name = "Feed the cats"
        task3.isImportant = false
        tasks.append(task3)

        return tasks
    }
    
    @IBAction func newTaskTapped(_ sender: Any) {
        performSegue(withIdentifier: "newTask", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = taskList[indexPath.row]
        
        if task.isImportant {
            cell.textLabel?.text = "❗️" + task.name
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let nextVC = segue.destination as! TaskInfoVC
        //prepare
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskVC
        nextVC.previousVC = self
    }


}

