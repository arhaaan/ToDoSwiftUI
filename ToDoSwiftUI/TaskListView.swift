//
//  TaskListView.swift
//  ToDoSwiftUI
//
//  Created by SGO-ARHAN on 05/03/25.
//

import SwiftUI

struct TaskListView: View {
    @Binding var date: Date
    @Binding var items: [Task]
    var currentDateTask: [Task] = []
    
    init(date: Binding<Date>, items: Binding<[Task]>) {
        self._date = date
        self._items = items
        currentDateTask = getCurrentDateTask()
    }
    
    var body: some View {
        VStack {
            ForEach(currentDateTask) { task in
                TaskListItem(task: task)
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
    
    func getCurrentDateTask() -> [Task] {
        return items.filter{ $0.date.toString(format: "EEEE,dd.MM.yyyy") == date.toString(format: "EEEE,dd.MM.yyyy")}.sorted { !$0.isCompleted && $1.isCompleted} 
    }
}

#Preview {
    ContentView()
        .environmentObject(DateManager())
        .environmentObject(TaskListManager())
}
