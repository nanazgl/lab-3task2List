//
//  main.swift
//  lab#3task2List
//
//  Created by Nazgul Atykhan 
//
import Foundation

struct Task {
    let title: String
    let description: String
    var isCompleted: Bool
}

struct ToDoList {
    var tasks: [Task]
    
    mutating func addTask(title: String, description: String) {
        let task = Task(title: title, description: description, isCompleted: false)
        tasks.append(task)
    }
    
    mutating func removeTask(title: String) {
        tasks.removeAll { $0.title == title }
    }
    
    mutating func markTaskAsCompleted(title: String) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = true
        }
    }
    
    func displayAllTasks() {
        print("All tasks in the to-do list:")
        for task in tasks {
            print("Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted ? "Yes" : "No")")
        }
    }
}
var toDoList = ToDoList(tasks: [])

toDoList.addTask(title: "Finish project", description: "Complete ios lab")
toDoList.addTask(title: "Buy groceries", description: "Go to magnum and buy items for the week")

var userInput: String = ""
while userInput != "exit" {
    print("\nEnter 'add' to add a new task, 'complete' to mark a task as completed, 'remove' to remove a task, 'display' to display all tasks, or 'exit' to quit:")
    userInput = readLine() ?? ""
    
    switch userInput {
    case "add":
        print("Enter the title of the task:")
        guard let title = readLine(), !title.isEmpty else {
            print("Invalid title. Task not added.")
            continue
        }
        
        print("Enter the description of the task:")
        guard let description = readLine(), !description.isEmpty else {
            print("Invalid description. Task not added.")
            continue
        }
        
        toDoList.addTask(title: title, description: description)
        print("Task added successfully.")
        
    case "complete":
        print("Enter the title of the task you want to mark as completed:")
        guard let title = readLine(), !title.isEmpty else {
            print("Invalid title.")
            continue
        }
        
        toDoList.markTaskAsCompleted(title: title)
        print("Task marked as completed.")
        
    case "remove":
        print("Enter the title of the task you want to remove:")
        guard let title = readLine(), !title.isEmpty else {
            print("Invalid title.")
            continue
        }
        
        toDoList.removeTask(title: title)
        print("Task removed successfully.")
        
    case "display":
        toDoList.displayAllTasks()
        
    case "exit":
        print("Exiting program.")
        
    default:
        print("Invalid input. Please try again.")
    }
}
