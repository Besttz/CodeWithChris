//
//  SettingView.swift
//  M4L6
//
//  Created by ZhangTommy on 18/7/2022.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var model : ViewModel

    var body: some View {
        NavigationView {
            
            List {
                Toggle("Show Name", isOn: $model.showName)
                Toggle("Show Years", isOn: $model.showYears)

                Toggle("Show Address", isOn: $model.showAddress)
                Toggle("Show Occupation", isOn: $model.showOccupation)

            }.navigationTitle("Settings")
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(ViewModel())
    }
}
