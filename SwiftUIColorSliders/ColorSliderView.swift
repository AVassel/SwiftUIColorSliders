//
//  ColorSliderView.swift
//  SwiftUIColorSliders
//
//  Created by Anton Vassel on 28.12.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            ColorTextView(value: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: sliderValue) { isOnFocus in
                    textValue = "\(lround(isOnFocus))"
                }
            
            ColorTextFieldView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorSliderView(sliderValue: .constant(127), color: .red)
        }
    }
}
