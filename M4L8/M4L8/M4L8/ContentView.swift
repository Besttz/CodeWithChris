//
//  ContentView.swift
//  M4L8
//
//  Created by ZhangTommy on 16/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(1..<20) { i in
                    Rectangle()
                        .fill (RadialGradient(
                            gradient: Gradient (colors: [.orange,.red]),
                            center: UnitPoint(x: 0.5, y: 0.5),
                            startRadius: 0,
                            endRadius: 200
                        ))
                        .frame( height: pow(1.1, CGFloat (i*3) ))
                        .cornerRadius(5.0)

                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
