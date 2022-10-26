//
//  ContentView.swift
//  M5L8Challenge
//
//  Created by ZhangTommy on 27/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ViewModel
    @State var goToView = false
    var body: some View {
        NavigationStack(path: $model.navPath) {
            VStack {
                Picker(selection: $model.pickerValue, label: Text("Picker")) {
                    ForEach(model.pickerContent, id: \.self) { index in
                        Text("\(index)")
                    }
                }.pickerStyle(.wheel)

                NavigationLink(value: model.pickerValue, label: {
                    Text("Go to view \(model.pickerValue)")
                })
                .navigationDestination(for: Int.self, destination: { _ in
                    SecondView()
                        .onAppear {
                            print(model.navPath)
                        }
                })
                
            }
            
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
