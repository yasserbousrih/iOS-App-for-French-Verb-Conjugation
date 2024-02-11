//
//  TaskProvider.swift
//  MidtermFall2023
//
//  Created by Daniel Carvalho on 24/10/23.
//

import Foundation

class TaskProvider {
    
    static var allTasks = [Task]()
    

    /// Generate mock date for testing purpouses
    static func generateMockData() {
        
        TaskProvider.allTasks = []        

        for i in 0..<100{
            allTasks.append(Task(description: "Task description #\(i+1)", instruction: "Task instruction \(i+1)", done: false))
        }
        
    }
    
    
}
