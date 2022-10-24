//
//  ContentView.swift
//  M5
//
//  Created by ZhangTommy on 20/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        NavigationStack(path:$model.navPath) {
            VStack(alignment: .leading) {
                Text("What do we want to do today?").padding(.horizontal)
                ScrollView {
                    LazyVStack {
        //                    .padding(.leading,20)
                        ForEach(model.modules) { module in
                            VStack(spacing: 20) {
                                
                                
                                NavigationLink(value: module.id){
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, lessons: module.content.lessons.count, time: module.content.time)
                                    
                                }
                                        .navigationDestination(for: Int.self) { id in
                                            ContentView()
                                                .onAppear {
                                                    model.beginModule(id)
                                                }
                                        }


                                NavigationLink {
                                    ContentView()

                                } label: {
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, lessons: module.content.lessons.count, time: module.content.time)
                                }
                                
                            }
                            .foregroundColor(.black)
                        }.padding()
                        
                        
                    }
                    
                }
            }.navigationTitle("Lessons")
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
