//
//  DateHeaderView.swift
//  ToDoSwiftUI
//
//  Created by Karim Arhan on 04/03/25.
//

import SwiftUI

struct DateHeaderView: View {
    
    @ObservedObject var viewModel: TaskHomePageViewModel
    
    var body: some View {
        ZStack {
            VStack {
                nameHeaderTextView()
                DateSliderView(viewModel: viewModel, dateViewContent: { week in
                    DateView(viewModel: viewModel, week: week)
                })
                .frame(height: 60, alignment: .top)
                
                Divider()
                
                HStack {
                    Spacer()
                    Text(viewModel.selectedDate.toString(format: "EEEE,dd.MM.yyyy"))
                        .font(.system(size: 10, design: .rounded))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func nameHeaderTextView() -> some View {
        HStack {
            VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                Text("Hi, Arhan")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(4)
                
                Text(viewModel.getSelectedDate() == Calendar.current.startOfDay(for: Date()) ? "What's up for today?" : "Planning for future?")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .padding(4)
                
            }
            
            
                    Spacer()
            
            VStack(alignment: .trailing) {
                Text(viewModel.getSelectedDate().monthToString())
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        viewModel.selectTheDay(with: Date())
                    }
                } label: {
                    Text("Today")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(.black)
                        .cornerRadius(4)
                }
            }
        }
    }
}

#Preview {
    TaskHomePage(viewModel: TaskHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDateProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRespository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
