//
//  LoginView.swift
//  GameSteamSwiftUI
//
//  Created by Dev IOS on 11/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var user:String = ""
    @State var contraseña:String = ""
    @State var onFocusLine1:Bool = false
    @State var onFocusLine2:Bool = false
    var body: some View {
        GeometryReader { proxy in
            
                VStack{
                    
                    Text("Correo electrónico").foregroundColor(Color("SecundaryColor")).font(
                        Font.custom("SF UI Display", size: 18)
                            .weight(.bold)
                    ).frame(width: proxy.size.width-40,alignment: .leading)
                    
                    PlaceholderTextField(
                        text: $user,
                        placeholder: "ejemplo@gmail.com",
                        textColor: UIColor(named: "White")!,
                        placeholderColor: .gray,
                        font:  UIFont(name: "SF UI Display", size: 14) ?? UIFont(name: "Arial", size: 14)!, isSecureEntry: false, onFocusChange: { onFocus in
                            
                            onFocusLine1 = onFocus
                            
                        }
                    ).frame(height: 16)
                    Divider().background(onFocusLine1 == true ? Color("SecundaryColor"):Color("White"))
                    
                    Text("Contraseña").padding(.top,36).foregroundColor(Color("White")).font(
                        Font.custom("SF UI Display", size: 18)
                            .weight(.bold)
                    ).frame(width: proxy.size.width-40,alignment: .leading)
                    
                    PlaceholderTextField(
                        text: $contraseña,
                        placeholder: "*****",
                        textColor: UIColor(named: "White")!,
                        placeholderColor: .gray,
                        font:  UIFont(name: "SF UI Display", size: 14) ?? UIFont(name: "Arial", size: 14)!, isSecureEntry: true, onFocusChange: { onFocus in
                            
                            onFocusLine2 = onFocus
                            
                        }
                    ).frame(height: 16)
                    Divider().background(onFocusLine2 == true ? Color("SecundaryColor"):Color("White"))
                    
                    Button {
                        print("bueno bonito")
                    } label: {
                        Text("¿Olvidaste tu contraseña?").frame(alignment: .trailing).foregroundColor(Color("SecundaryColor")).font(Font.custom("SF UI Display", size: 12))
                    }.padding(.trailing,-150).padding(.top,12)

                    
                    Button {
                        print("INICIAR SESIÓN")
                    } label: {
                        Text("INICIAR SESIÓN").frame(maxWidth: .infinity,alignment: .center).foregroundColor(Color("SecundaryColor")).font(Font.custom("SF UI Display", size: 12))
                            .padding(.vertical,12)
                            .overlay(RoundedRectangle(cornerRadius:6.0).stroke(Color("SecundaryColor"), lineWidth: 1.0).shadow(color: Color("SecundaryColor"), radius: 6) )
                    }.frame(alignment: .center).padding(.top, 53)
                    
                    Text("Inicia sesión con redes sociales")
                    .font(Font.custom("Lato", size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.top,66)
                    
                    HStack(spacing: 10, content: {
                        
                        Button {
                            print("Facebook")
                        } label: {
                            Image("Facebook").resizable().frame(width: 64,height: 64,alignment: .center)
                        }

                        Button {
                            print("Xtwitter")
                        } label: {
                            Image("Xtwitter").resizable().frame(width: 64,height: 64,alignment: .center)
                        }
                        
                    }).frame(alignment: .center).padding(.top,22).padding(.bottom,30)
                    
                }.padding(.horizontal, 20.0)
                
            
        }
        
    }
}

#Preview {
    LoginView()
}
