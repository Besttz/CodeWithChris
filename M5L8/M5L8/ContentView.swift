//
//  ContentView.swift
//  M5L8
//
//  Created by ZhangTommy on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State var navPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $navPath, root: {
            VStack(spacing: 20){
                NavigationLink(value: 1) {
                    Text("Nav to 1")
                }.navigationDestination(for: Int.self) { _ in
                    SecondView(navPath: $navPath)
                        .onAppear(){
                            print(navPath)
                        }
                }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
