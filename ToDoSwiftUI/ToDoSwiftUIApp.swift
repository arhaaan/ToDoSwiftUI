//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by Karim Arhan on 02/03/25.
//

import SwiftUI

@main
struct ToDoSwiftUIApp: App {
    
    @StateObject var dateManager: DateManager = DateManager()
    @StateObject var taskListManager: TaskListManager = TaskListManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateManager)
                .environmentObject(taskListManager)
        }
    }
}
