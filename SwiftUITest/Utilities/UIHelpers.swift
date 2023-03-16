//
//  UIHelpers.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import SwiftUI

struct TextView: View {
    let text: String
    let size: CGFloat
    let color: Color
    let fontWeight: Font.Weight
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text(text)
            .font(.system(size: size))
            .foregroundColor(colorScheme == .dark ? .white : color)
            .fontWeight(fontWeight)
    }
}



struct ResizableImage: View {
    let systemName: String
    let color: Color
    let size: CGFloat
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .foregroundColor(color)
            .frame(width: size, height: size)
    }
}


struct RoundedRectangleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.gray)
            .frame(height: 1)
            .padding(.vertical)
    }
}
