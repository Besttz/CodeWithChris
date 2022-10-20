//
//  HomeViewRow.swift
//  M5
//
//  Created by ZhangTommy on 20/10/2022.
//

import SwiftUI

struct HomeViewRow: View {
    var image : String
    var title : String
    var description : String
    var lessons : Int
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175),contentMode: .fit)
            HStack(alignment: .center){
                Image(image)
                    .resizable()
                    .foregroundColor(.accentColor)
                    .clipShape(Circle())
                    .frame(width: 130,height: 130)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .padding(.bottom, 5)
                    Text(description)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,20 )
                    Spacer()
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 12,height: 12)
                        Text("\(lessons) Lessons")
                            .font(.caption)
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 12,height: 12)
                        Text(time)
                            .font(.caption)
                    }
                    Spacer()

                }.padding()
            }.padding()
            
        }
    }
}


