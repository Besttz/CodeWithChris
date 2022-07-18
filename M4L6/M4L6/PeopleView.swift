//
//  PeopleView.swift
//  M4L6
//
//  Created by ZhangTommy on 18/7/2022.
//

import SwiftUI

struct PeopleView: View {
    @EnvironmentObject var model:ViewModel
    var body: some View {
        NavigationView {
            
            List(model.peoples) { people in
                VStack(alignment: .leading) {
                    if model.showName {
                        Text(people.name).font(.title2)
                    }
                    if model.showYears {
                        Text("\(people.yearsOfExperience) Years being: ")
                    }
                    if model.showOccupation {
                        Text(people.occupation)
                    }
                    if model.showAddress {
                        Text(people.address)
                    }
                }
            }
            .navigationBarTitle("People")
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView().environmentObject(ViewModel())
    }
}
