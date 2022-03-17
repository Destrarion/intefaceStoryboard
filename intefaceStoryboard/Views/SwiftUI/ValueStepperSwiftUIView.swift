//
//  ValueStepperSwiftUIView.swift
//  intefaceStoryboard
//
//  Created by Fabien Dietrich on 17/03/2022.
//

import Foundation


import SwiftUI



struct ValueStepperSwiftUIView: View {
   
    @StateObject private var viewModel = ValueStepperViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.countDescription)
            Spacer()
            HStack {
                ForEach(viewModel.buttonViewModels, id: \.title) { buttonViewModel in
                    Button {
                        buttonViewModel.action()
                    } label: {
                        Text(buttonViewModel.title)
                    }
                    .frame(width: 60)

                }
            }
            Spacer()
        }
    }
}

