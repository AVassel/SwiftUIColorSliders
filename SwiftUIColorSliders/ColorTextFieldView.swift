//
//  ColorTextFieldView.swift
//  SwiftUIColorSliders
//
//  Created by Anton Vassel on 28.12.2022.
//

import SwiftUI

struct ColorTextFieldView: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
                checkValue()
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong format!", isPresented: $showAlert, actions: {}) {
            Text("Value mast be in range 0...255")
        }
    }
}

struct ColorTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorTextFieldView(textValue: .constant("127"), value: .constant(128.0))
        }
    }
}

extension ColorTextFieldView {
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = Int(textValue) ?? 0 > 255 ? 255 : 0
        textValue = String(value)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
