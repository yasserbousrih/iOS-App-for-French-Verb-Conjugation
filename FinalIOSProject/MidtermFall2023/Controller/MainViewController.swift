//
//  MainViewController.swift
//  MidtermFall2023
//
//  Created by Daniel Carvalho on 24/10/23.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TaskInfoViewControllerDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    
    private var selectedRow: Int?
    
    @IBOutlet weak var lblUsername : UILabel!
    

    @IBOutlet weak var swShowOnlyTasksDone : UISwitch!
    
    @IBOutlet weak var txtPassword : UITextField!
    
    @IBAction func showPasswordButton(_ sender: Any) {
        txtPassword .isSecureTextEntry = false  ;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    
    
    private func initialize(){
        lblUsername.text = "hello"
        
        TaskProvider.generateMockData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    @IBAction func swShowOnlyTasksDoneChanged( _ sender : Any? ){

        // not implemented
        
    }
    
    @IBAction func btnLogOffTapped( _ sender : Any? ){
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Define the number of rows in the table view
        return TaskProvider.allTasks.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()

        let task = TaskProvider.allTasks[indexPath.row] // Get the task for the current row.

        content.text = task.description // Set the main text for the cell.
        content.secondaryText = task.instruction // Set the secondary text for the cell.

        if task.done {
            content.image = UIImage(systemName: "checkmark") // If the task is done, show a checkmark.
            content.imageProperties.tintColor = .green // Set the checkmark color to green.
        } else {
            content.image = UIImage(systemName: "square") // If the task is not done, show a square.
            content.imageProperties.tintColor = .red // Set the square color to red.
        }

        cell.contentConfiguration = content

        print(TaskProvider.allTasks[indexPath.row]) // Print task details.
        
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)

        print("\(TaskProvider.allTasks[indexPath.row]) SELECTED!!!") // Print the selected task details.

        self.selectedRow = indexPath.row // Store the selected row for future reference.

        performSegue(withIdentifier: Segue.toTaskInfoViewController, sender: self) // Perform a segue to another view controller.
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toTaskInfoViewController { // Check if the segue is to the SecondViewController.
            (segue.destination as! TaskInfoViewController).selectedTask = TaskProvider.allTasks[self.selectedRow!] // Pass the selected task to the next view controller.
        }

        (segue.destination as! TaskInfoViewController).delegate = self
    }
    
    func refreshTable() {
        // Refresh the table view data.
        tableView.reloadData()
    }
    
    
    

}

