//
//  TaskRepository.swift
//  ToDoSwiftUI
//
//  Created by SGO-ARHAN on 06/03/25.
//

import Foundation

protocol TaskRepositoryProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTask(of date: Date) -> [Task]
}

class TaskRepository {
    private let taskDataProvider: TaskDataProviderProtocol
    
    init(taskDataProvider: TaskDataProviderProtocol) {
        self.taskDataProvider = taskDataProvider
    }
}

extension TaskRepository: TaskRepositoryProtocol {
    func getTaskList() -> [Task] {
        taskDataProvider.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskDataProvider.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskDataProvider.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskDataProvider.deleteTask(task: task)
    }
    
    func getCurrentSelectedDateTask(of date: Date) -> [Task] {
        taskDataProvider.getCurrentSelectedDateTasks(of: date)
    }
}
