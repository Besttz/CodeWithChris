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
            
            CodeTextView()
            
            if model.haveNextLesson() {
                Button {
                    model.goNextLesson()
                } label: {
                    ZStack{
                        RectangleCard()
                        Text("Next \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                    }
                }
            } else {
                // Show complete button
                Button {
                    // Take user to the home view
                    model.navPath.removeLast( model.navPath.count)
                } label: {
                    ZStack{
                        RectangleCard()
                        Text("Complete")
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
