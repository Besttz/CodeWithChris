//
//  RectangleCard.swift
//  M5
//
//  Created by ZhangTommy on 25/10/2022.
//

import SwiftUI

struct RectangleCard: View {
    var color = Color.green
    var height = 48.0
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(height: height)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
