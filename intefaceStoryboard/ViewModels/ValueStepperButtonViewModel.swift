//
//  ValueStepperButtonViewModel.swift
//  intefaceStoryboard
//
//  Created by Fabien Dietrich on 17/03/2022.
//

import Foundation



final class ValueStepperButtonViewModel: ObservableObject {
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    let title: String
    let action: () -> Void
}
