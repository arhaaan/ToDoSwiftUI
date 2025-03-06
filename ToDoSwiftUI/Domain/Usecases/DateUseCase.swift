//
//  DateUseCase.swift
//  ToDoSwiftUI
//
//  Created by SGO-ARHAN on 06/03/25.
//

import Foundation

protocol DateUseCaseProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateUseCase {
    private let dateRepository: DateRepositoryProtocol
    
    init(dateRepository: DateRepositoryProtocol) {
        self.dateRepository = dateRepository
    }
}

extension DateUseCase: DateUseCaseProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateRepository.calculatePastAndFutureWeeks(with: date)
    }
}
