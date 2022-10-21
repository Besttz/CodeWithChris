//
//  ContentDetailView.swift
//  M5
//
//  Created by ZhangTommy on 21/10/2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let videoJostUrl = "https://codewithchris.github.io/learningJSON/"
        VStack {
            let url = URL(string: videoJostUrl + (lesson?.video ?? ""))
            if let url = url {
                VideoPlayer(player: AVPlayer(url: url))
                    .cornerRadius(10)
                
            }
            if model.haveNextLesson() {
                Button {
                    model.goNextLesson()
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(height: 48)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        Text("Next \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                    }
                }
            }
            
            
        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

//struct ContentDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentDetailView()
//    }
//}
