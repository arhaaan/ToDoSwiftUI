//
//  TaskUseCase.swift
//  ToDoSwiftUI
//
//  Created by SGO-ARHAN on 06/03/25.
//

import Foundation

protocol TaskUseCaseProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTask(of date: Date) -> [Task]
}

final class TaskUseCase {
    private let taskRespository: TaskRepositoryProtocol
    
    init(taskRespository: TaskRepositoryProtocol) {
        self.taskRespository = taskRespository
    }
}

extension TaskUseCase: TaskUseCaseProtocol {
    func getTaskList() -> [Task] {
        taskRespository.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskRespository.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskRespository.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskRespository.deleteTask(task: task)
    }
    
    func getCurrentSelectedDateTask(of date: Date) -> [Task] {
        taskRespository.getCurrentSelectedDateTask(of: date)
    }
}
