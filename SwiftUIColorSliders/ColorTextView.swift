//
//  ColorTextView.swift
//  SwiftUIColorSliders
//
//  Created by Anton Vassel on 28.12.2022.
//

import SwiftUI

struct ColorTextView: View {
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 40)
            .foregroundColor(.white)
    }
}

struct TextColorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.gray
            ColorTextView(value: 127)
        }
    }
}
