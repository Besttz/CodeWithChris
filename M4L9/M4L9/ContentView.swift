//
//  ContentView.swift
//  M4L9
//
//  Created by ZhangTommy on 16/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = "1"
    var body: some View {
        VStack{
            
            Picker("Tap Me", selection: $selectedIndex) {
                Text("#1").tag("1")
                Text("#2").tag("2")

            }
            .pickerStyle(.segmented)
            .padding()
            Text("Current Selecting: \(selectedIndex)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
