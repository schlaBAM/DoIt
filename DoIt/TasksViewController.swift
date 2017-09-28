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
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getTasks()
        tableView.reloadData()
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            taskList = try context.fetch(Task.fetchRequest()) as! [Task]
            print(taskList)
        } catch {
            print("Core data error")
        }
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
            cell.textLabel?.text = "❗️" + task.name!
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = taskList[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "viewTask", sender: task)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewTask"{
            //task selected
            let nextVC = segue.destination as! TaskInfoVC
            nextVC.task = (sender as! Task)
            nextVC.tasksVC = self
        }
    }


}

