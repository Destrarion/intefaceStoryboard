//
//  ValueStepperViewModel.swift
//  intefaceStoryboard
//
//  Created by Fabien Dietrich on 17/03/2022.
//

import Foundation
import Combine


final class ValueStepperViewModel: ObservableObject {
    
    init() {
        setupSubscriptions()
    }
    
    
    @Published var countDescription = ""
    
    lazy var buttonViewModels: [ValueStepperButtonViewModel] = [
        .init(title: "-", action: valueStepperService.minus),
        .init(title: "+", action: valueStepperService.plus),
        .init(title: "Reset", action: valueStepperService.reset),
        .init(title: "Divide", action: valueStepperService.divideByTwo),
        .init(title: "Double", action: valueStepperService.double)
    ]
    
    
    private func setupSubscriptions() {
        valueStepperService.countPublisher
            .receive(on: RunLoop.main)
            .map { $0.description + " cm" }
            .assign(to: \.countDescription, on: self)
            .store(in: &subscriptions)
        
    }
    
    
    private var subscriptions: Set<AnyCancellable> = []
 
    
    private let valueStepperService = ValueStepperService()
}
