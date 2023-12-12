//
//  PlaceHolderTextField.swift
//  GameSteamSwiftUI
//
//  Created by Dev IOS on 11/12/23.
//

import SwiftUI

struct PlaceholderTextField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var textColor: UIColor
    var placeholderColor: UIColor
    var font: UIFont
    var isSecureEntry: Bool
    var onFocusChange: (Bool) -> Void
    var keyboardType: UIKeyboardType = .default // Add keyboard type property

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var onFocusChange: (Bool) -> Void

        init(text: Binding<String>, onFocusChange: @escaping (Bool) -> Void) {
            _text = text
            self.onFocusChange = onFocusChange
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            onFocusChange(true)
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            onFocusChange(false)
        }
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.textColor = textColor
        textField.font = font
        textField.isSecureTextEntry = isSecureEntry
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor, NSAttributedString.Key.font: font]
        )
        textField.keyboardType = keyboardType // Set keyboard type
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = isSecureEntry
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, onFocusChange: onFocusChange)
    }
}

