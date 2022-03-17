//
//  ValueStepperService.swift
//  intefaceStoryboard
//
//  Created by Fabien Dietrich on 17/03/2022.
//

import Foundation
import Combine


// DELEGATE
// CLOSURE
// NOTIFICATION
// PUBLISHER SUBSCRIBER (Combine)
// APPEL METHOD / VALUE RETURN


// MARK: MODEL

final class ValueStepperService {
    
    func plus() {
        count += 1
    }
    
    func minus() {
        count -= 1
    }
    
    func reset() {
        count = 0
    }
    
    func double() {
        count *= 2
    }
    
    func divideByTwo() {
        count /= 2
    }
    
    private var count = 0 {
        didSet {
            countPublisher.send(count)
        }
    }
    
    let countPublisher = CurrentValueSubject<Int, Never>(0)
}
