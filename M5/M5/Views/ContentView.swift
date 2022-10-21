//
//  ContentView.swift
//  M5
//
//  Created by ZhangTommy on 21/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        ScrollView{
            
            LazyVStack{
                
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        let lesson = model.currentModule!.content.lessons [index]
                        
                        NavigationLink {
                            ContentDetailView()
                                .onAppear(){
                                    model.beginLesson(index)
                                }
                        } label: {
                            ZStack(alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .frame(height: 66)
                                HStack (spacing: 30) {
                                    Text("\(index + 1)")
                                        .bold()
                                        .padding()
                                    VStack(alignment: .leading){
                                        Text(lesson.title)
                                            .bold()
                                        Text(lesson.duration)
                                    }
                                }
                                .foregroundColor(.black)
                                
                            }.padding(10)
                            
                        }
                        
                    }
                }
                
            }
        }.navigationTitle("Learn \(model.currentModule?.category ?? "")")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hi")
        //        ContentView()
        //            .environmentObject(model)
        //            .onAppear {
        //                model.beginModule(0)
        //            }
    }
}
