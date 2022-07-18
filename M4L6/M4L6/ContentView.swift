//
//  ContentView.swift
//  M4L6
//
//  Created by ZhangTommy on 18/7/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

            TabView {
                
                PeopleView().tabItem {
                    Text("People")
                }
                
                SettingView()
                    .tabItem{Text("Setting")}
                
            }.environmentObject(ViewModel())
            
       
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
