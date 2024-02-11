//
//  TaskInfoViewController.swift
//  MidtermFall2023
//
//  Created by Daniel Carvalho on 24/10/23.
//

import UIKit

protocol TaskInfoViewControllerDelegate {
    
    func refreshTable()
}

class TaskInfoViewController: UIViewController {
    
    public var delegate: TaskInfoViewControllerDelegate?
    
    public var selectedTask : Task?
    
    var loggedUser : String?
    
    @IBOutlet weak var btnDelete : UIBarButtonItem!

    @IBOutlet weak var txtDescription : UITextField!
    @IBOutlet weak var txtInstruction : UITextField!
    @IBOutlet weak var swDone : UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedTask != nil {
            txtDescription.text = selectedTask!.description
            txtInstruction.text = selectedTask!.instruction
            swDone.isOn = selectedTask!.done
        } else {
           
            swDone.isOn = false
            btnDelete.isHidden = true
        }

    }
    
    
    private func initialize() {
        
        if selectedTask != nil {

            txtDescription.text = selectedTask!.description
            txtInstruction.text = selectedTask!.instruction
            swDone.isOn = selectedTask!.done
            
        } else {
            btnDelete.isHidden = true
            
        }
    }
    
    @IBAction func btnSaveTapped(_ sender : Any?) {
        if selectedTask != nil {
            selectedTask!.description = txtDescription.text!
            selectedTask!.instruction = txtInstruction.text!
            selectedTask!.done = swDone.isOn
        } else {
            let newTask = Task (description : txtDescription.text! , instruction: txtInstruction.text! , done: swDone.isOn)
            //Task(description: txtDescription.text!, instructions: txtInstruction.text!, done: swDone.isOn)
            TaskProvider.allTasks.append(newTask)
        }

        if self.delegate != nil {
            self.delegate!.refreshTable()
        }

        navigationController?.popViewController(animated: true)
    }

    
    func yesDelete( action : UIAlertAction ) {

        for i in 0..<TaskProvider.allTasks.count {
            if TaskProvider.allTasks[i] === self.selectedTask! {
                TaskProvider.allTasks.remove(at: i)
                break
            }
        }

        
        if self.delegate != nil {
            self.delegate!.refreshTable()
        }

        navigationController?.popViewController(animated: true)
        
    }

    func DoNotDelete( action : UIAlertAction ) {
        return
    }

    
    
    @IBAction func btnDeleteTapped(_ sender : Any?) {

       
       
    }

    
}
