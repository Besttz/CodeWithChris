//
//  ContentView.swift
//  M4L9Challenge
//
//  Created by ZhangTommy on 16/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State var location = "Perth"
    @State var meal = "salmon"
    @State var time = 1600
    var timeArray = [1600,1700,1800,1900,2000,2100]

    var body: some View {
        NavigationView {
            VStack {
                
                
                Text("Select your meal:").font(.title2)
                Picker("Meal", selection: $meal) {
                    Text("Grilled Salmon").tag("salmon")
                    Text("Pad Thai").tag("padthai")
                    Text("Nachos").tag("nachos")
                }.pickerStyle(.wheel).padding(.horizontal)
                
                HStack{
                    Text("Location: ")
                    Picker("Location", selection: $location) {
                        Text("Perth").tag("Perth")
                        Text("Subiaco").tag("Subiaco")
                        Text("Claremont").tag("Claremont")
                    }
                }.padding()
                
                Picker("Pickup Time:", selection: $time) {
                    Text("4pm").tag(1600)
                    Text("5pm").tag(1700)
                    Text("6pm").tag(1800)
                    Text("7pm").tag(1900)
                    Text("8pm").tag(2000)
                    Text("9pm").tag(2100)

                }.pickerStyle(.segmented).padding(.horizontal)
                
                Button("Random") {
                    let randomInt = Int.random(in: 0..<timeArray.count)
                    time = timeArray[randomInt]
                }.buttonStyle(.borderedProminent).padding(50)
                
            }.navigationTitle("Ottimo Ristorante")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
