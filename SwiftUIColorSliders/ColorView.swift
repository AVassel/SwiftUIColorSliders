//
//  ColorView.swift
//  SwiftUIColorSliders
//
//  Created by Anton Vassel on 28.12.2022.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red/255, green: green/255, blue: blue/255)
            .cornerRadius(30)
            .frame(height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: 4)
            )
            
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 125, green: 125, blue: 125)
    }
}
