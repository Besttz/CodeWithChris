//
//  ViewModel.swift
//  M5L8Challenge
//
//  Created by ZhangTommy on 27/10/2022.
//

import Foundation
import SwiftUI

class ViewModel :ObservableObject {
//    @Published var navPath = NavigationPath()
    @Published var navPath = [Int]()

    var pickerContent = [1,2,3,4,5,6,7,8,9,10]
    @Published var pickerValue = 1
}
