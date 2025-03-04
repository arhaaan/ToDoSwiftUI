//
//  DateView.swift
//  ToDoSwiftUI
//
//  Created by Karim Arhan on 04/03/25.
//

import SwiftUI

struct DateView: View {
    @EnvironmentObject var weekManager: DateManager
    var week: WeekModel
    
    var body: some View {
        HStack{
            ForEach(0..<7) { i in
                VStack {
                    Text(week.dates[i].toString(format: "EEE").uppercased())
                        .font(.system(size: 10))
                        .fontWeight(week.dates[i] == week.referenceDate ? .semibold : .light)
                        .foregroundColor(week.dates[i] == week.referenceDate ? .white : .black)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Text(week.dates[i].toString(format: "d"))
                        .font(.system(size: 16))
                        .fontWeight(week.dates[i] == week.referenceDate ? .bold : .light)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(week.dates[i] == week.referenceDate ? .white : .black)
                }
                .frame(maxWidth: .infinity)
                .padding(5)
                .background(week.dates[i] == week.referenceDate ? .black : .clear)
                .clipShape(.rect(cornerRadius: 10))
                .onTapGesture {
                    withAnimation(.linear(duration: 0.1)) {
                        weekManager.selectedDate = week.dates[i]
                    }
                }
            }
        }
    }
}

#Preview {
    DateView(week: .init(index: 1, dates:
    [
        Date().yesterday.yesterday.yesterday,
        Date().yesterday.yesterday,
        Date().yesterday,
        Date(),
        Date().tomorrow,
        Date().tomorrow.tomorrow,
        Date().tomorrow.tomorrow.tomorrow,
    ], referenceDate: Date()))
    .environmentObject(DateManager())
    
}
