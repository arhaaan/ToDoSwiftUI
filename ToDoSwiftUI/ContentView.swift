//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Karim Arhan on 02/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var createNewTask: Bool = false
    
    @EnvironmentObject var weekManager: DateManager
    @EnvironmentObject var taskListManager: TaskListManager
    
    var body: some View {
        ZStack {
            VStack {
                DateHeaderView()
                ScrollView(.vertical) {
                    VStack {
                        TaskListView(date: $weekManager.selectedDate, items: $taskListManager.items)
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
            NewTaskView().presentationDetents([.fraction(0.4)])
        })
    }
}

#Preview {
    ContentView()
        .environmentObject(DateManager())
        .environmentObject(TaskListManager())
}
