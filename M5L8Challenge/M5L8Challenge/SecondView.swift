//
//  SecondView.swift
//  M5L8Challenge
//
//  Created by ZhangTommy on 27/10/2022.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var model: ViewModel

    var body: some View {
        VStack {
            Text("This is View \(model.pickerValue)")
                .font(.title)
                .padding()
            Button("Go Back") {
                model.navPath.removeLast(model.navPath.count) 
            }
        }
         .navigationBarBackButtonHidden()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(ViewModel())
    }
}
