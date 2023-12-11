//
//  TwoOptionsButtons.swift
//  GameSteamSwiftUI
//
//  Created by Dev IOS on 11/12/23.
//

import SwiftUI

struct TwoOptionsButtons: View {
    let button1Text: String
    let button2Text: String
    let buttonAction1: () -> Void
    let buttonAction2: () -> Void
    @State var button1IsActive: Bool = true
    @State var button2IsActive: Bool = false
    
    init(button1Text: String = "INICIA SESIÓN",
         button2Text: String = "REGÍSTRATE",
         buttonAction1: @escaping () -> Void = {},
         buttonAction2: @escaping () -> Void = {}) {
        self.button1Text = button1Text
        self.button2Text = button2Text
        self.buttonAction1 = buttonAction1
        self.buttonAction2 = buttonAction2
    }
    
    
    
    var body: some View {
        HStack {
            Spacer()
            Button(action:  {
                buttonAction1()
                button1IsActive = true
                button2IsActive = false// Call the function to toggle the state
            }) {
                Text(button1Text).foregroundColor(button1IsActive == true ? Color("White") : Color("GrayColor") ).frame(alignment: .center).font(
                    Font.custom("SF UI Display", size: 18)
                        .weight(.bold)
                )
                .kerning(1.44)
            }
            Spacer()
            Button(action: {
                buttonAction2()
                button1IsActive = false
                button2IsActive = true
            }) {
                    Text(button2Text).foregroundColor(button2IsActive == true ? Color("White") : Color("GrayColor") ).frame(alignment: .center)
                }.font(Font.custom("SF UI Display", size: 18))
                .kerning(1.44)
            Spacer()
        }
    }
}

#Preview {
    TwoOptionsButtons()
}
