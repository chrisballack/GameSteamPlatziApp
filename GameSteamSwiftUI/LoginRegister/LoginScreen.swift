//
//  LoginScreen.swift
//  GameSteamSwiftUI
//
//  Created by Dev IOS on 11/12/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var isLogin: Bool = false
    @State private var isKeyboardVisible: Bool = false
    
    var body: some View {
        ZStack {
            Color("PrimaryColor").ignoresSafeArea()
            
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 186.19719, height: 20, alignment: .center)
                    .padding(.horizontal, 94)
                
                TwoOptionsButtons(button1Text: "INICIA SESIÓN", button2Text: "REGÍSTRATE") {
                    print("Button1")
                    isLogin = true
                } buttonAction2: {
                    print("Button2")
                    isLogin = false
                }
                .padding(.top, 54)
                
                if isLogin {
                    Spacer(minLength: 49)
                    LoginView()
                } else {
                    Spacer(minLength: 49)
                    RegistView()
                }
            }
            .padding(.top, 4)
            
        }.onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                isKeyboardVisible = true
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                isKeyboardVisible = false
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    LoginScreen()
}
