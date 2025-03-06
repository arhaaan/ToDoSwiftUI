//
//  DateRepository.swift
//  ToDoSwiftUI
//
//  Created by SGO-ARHAN on 06/03/25.
//

import Foundation

protocol DateRepositoryProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateRepository {
    private let dateDateProvider: DateDataProviderProtocol
    
    init(dateDateProvider: DateDataProviderProtocol) {
        self.dateDateProvider = dateDateProvider
    }
}

extension DateRepository: DateRepositoryProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateDateProvider.calculatePastAndFutureWeeks(with: date)
    }
}
