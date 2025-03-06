//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Karim Arhan on 02/03/25.
//

import SwiftUI

struct TaskHomePage: View {
    @State private var createNewTask: Bool = false
    
    @ObservedObject var viewModel: TaskHomePageViewModel
    
    var body: some View {
        ZStack {
            VStack {
                DateHeaderView(viewModel: viewModel)
                ScrollView(.vertical) {
                    VStack {
                        TaskListView(viewModel: viewModel)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
            .overlay(alignment: .bottomTrailing) {
                Button {
                    createNewTask.toggle()
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding(26)
                        .background(.black)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
            }
        }
        .sheet(isPresented: $createNewTask, content: {
            NewTaskView(){task in
                viewModel.updateTaskList(task: task)
            }.presentationDetents([.fraction(0.4)])
        })
    }
}

#Preview {
    TaskHomePage(viewModel: TaskHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDateProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRespository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
