//
//  ViewController.swift
//  intefaceStoryboard
//
//  Created by Fabien Dietrich on 17/03/2022.
//

import UIKit
import Combine



final class ValueStepperViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        viewModel.buttonViewModels.forEach { buttonViewModel in
            let button = UIButton(
                type: .system,
                primaryAction: UIAction(
                    title: buttonViewModel.title,
                    handler: { _ in
                        buttonViewModel.action()
                    }
                )
            )
          
            buttonStackView.addArrangedSubview(button)
        }
        
        setupSubscriptions()
        
    }
    
    private func setupSubscriptions() {
        viewModel.$countDescription
            .receive(on: RunLoop.main)
            .map { Optional($0) }
            .assign(to: \.text, on: countLabel)
            .store(in: &subscriptions)
    }

    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!
    
    private let viewModel = ValueStepperViewModel()
    private var subscriptions: Set<AnyCancellable> = []

}


