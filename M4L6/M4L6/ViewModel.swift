//
//  ViewModel.swift
//  M4L6
//
//  Created by ZhangTommy on 18/7/2022.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var peoples = [People]()
    @Published var showName = true
    @Published var showOccupation = true
    @Published var showAddress = true
    @Published var showYears = true

    
    init() {
        peoples.append(People(name: "Zhenyu",occupation: "Gay", address: "Gaytown, VIC 3000", yearsOfExperience: -1))
       peoples.append(People(name: "Yang",occupation: "Chick", address: "Gaytown, VIC 3000", yearsOfExperience: 5))

    }
}

struct People:Identifiable {
    
    var id = UUID()
    var name = ""
    var occupation = ""
    var address = ""
    var yearsOfExperience = 0
}
