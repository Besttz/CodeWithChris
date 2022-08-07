//
//  ContentView.swift
//  M4L7
//
//  Created by ZhangTommy on 25/7/2022.
//

import SwiftUI

struct ContentView: View {
    var model = viewModel()
    var body: some View {
        
        VStack{
            
            GeometryReader { geo in
                
                TabView {
                    ForEach(model.number, id:  \.self) { num in
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)) )
                            
//                            Text("Hello, world! \(num) ")
//                                .padding(50)
                            
                            Image(systemName: "\(num).circle")
                                .font(.system(size: 240.0, weight: .medium))
                            
                        }
                        .frame(width: geo.size.width-50, height: geo.size.height-100)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
