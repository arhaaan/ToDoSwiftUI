//
//  TaskListView.swift
//  ToDoSwiftUI
//
//  Created by SGO-ARHAN on 05/03/25.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskHomePageViewModel
    var currentDateTask: [Task] = []
    
    init(viewModel: TaskHomePageViewModel) {
        self.viewModel = viewModel
        currentDateTask = viewModel.getCurrentSelectedDateTask()
    }
    
    var body: some View {
        VStack {
            ForEach(currentDateTask) { task in
                TaskListItem(task: task, onPress: { Task in
                    toggleTaskCompletion(task: task)
                }, onLongPress: { Task in
                    deleteTask(task: task)
                })
                    .background(alignment: .leading) {
                        if currentDateTask.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 12 ,y: 20)
                        }
                    }
            }
        }
        .padding(.top, 15)
    }
    
    func toggleTaskCompletion(task: Task) {
        viewModel.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) {
        viewModel.deleteTask(task: task)
    }
}

#Preview {
    TaskHomePage(viewModel: TaskHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDateProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRespository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
