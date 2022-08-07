//
//  ViewModel.swift
//  M4L7
//
//  Created by ZhangTommy on 25/7/2022.
//

import Foundation

class viewModel:ObservableObject {
    
    var number = [1]
    
    init() {
        for i in 2...50 {
            number.append(i)
        }
    }
}
