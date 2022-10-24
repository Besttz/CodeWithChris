//
//  SecondView.swift
//  M5L8
//
//  Created by ZhangTommy on 25/10/2022.
//

import SwiftUI

struct SecondView: View {
//    @State var navTag : Index
    @Binding var navPath : NavigationPath
    var body: some View {
        Button {
            navPath.removeLast()
        } label: {
            Text("Get Back")
        }

    }
}
//
//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
