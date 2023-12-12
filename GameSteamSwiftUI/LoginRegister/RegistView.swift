//
//  RegistView.swift
//  GameSteamSwiftUI
//
//  Created by Dev IOS on 11/12/23.
//

import SwiftUI
import AVFoundation

struct RegistView: View {
    
    @State private var isImagePickerPresented: Bool = false
    @State private var image: UIImage?
    @State private var cameraAccessDenied: Bool = false
    @State var user:String = ""
    @State var contraseña:String = ""
    @State var contraseñaOther:String = ""
    @State var onFocusLine1:Bool = false
    @State var onFocusLine2:Bool = false
    @State var onFocusLine3:Bool = false
    var body: some View {
        
            ScrollView {
                VStack{
                    
                    Text("Elije una foto de perfil")
                        .font(
                            Font.custom("SF UI Display", size: 18)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    Text("Puedes cambiar o elegirla más adelante")
                        .font(Font.custom("SF UI Display", size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("GrayColor")).padding(.top,5)
                    
                    Button {
                        
                        checkCameraPermission { result in
                            if(result){
                                
                                isImagePickerPresented.toggle()
                                
                                
                            }
                        }
                        
                    } label: {
                        ZStack(alignment: .center) {
                            
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 85, height: 85)
                                    .clipShape(Circle())
                            } else {
                                Image("PreViewImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 85, height: 85)
                                    .clipShape(Circle())
                                Image(systemName: "camera").resizable().frame(width: 30, height: 30).scaledToFit().foregroundColor(Color("White"))
                            }
                            
                        }
                    }.padding(.top,24)
                        .fullScreenCover(isPresented: $isImagePickerPresented) {
                            ImagePicker(image: $image, isImagePickerPresented: $isImagePickerPresented)
                        }
                    
                    
                    
                    VStack(alignment:.leading){
                        Text("Correo electrónico*").foregroundColor(Color("SecundaryColor")).font(
                            Font.custom("SF UI Display", size: 18)
                                .weight(.bold)
                        ).frame(alignment: .leading)
                        
                        PlaceholderTextField(
                            text: $user,
                            placeholder: "ejemplo@gmail.com",
                            textColor: UIColor(named: "White")!,
                            placeholderColor: .gray,
                            font:  UIFont(name: "SF UI Display", size: 14) ?? UIFont(name: "Arial", size: 14)!, isSecureEntry: false, onFocusChange: { onFocus in
                                
                                onFocusLine1 = onFocus
                                
                            },
                            keyboardType: .emailAddress
                        ).frame(height: 16).keyboardType(.emailAddress)
                        Divider().background(onFocusLine1 == true ? Color("SecundaryColor"):Color("White"))
                        
                        Text("Contraseña*").padding(.top,36).foregroundColor(Color("White")).font(
                            Font.custom("SF UI Display", size: 18)
                                .weight(.bold)
                        ).frame(alignment: .leading)
                        
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
                        
                        Text("Confirmar contraseña*").padding(.top,36).foregroundColor(Color("White")).font(
                            Font.custom("SF UI Display", size: 18)
                                .weight(.bold)
                        ).frame(alignment: .leading)
                        
                        PlaceholderTextField(
                            text: $contraseñaOther,
                            placeholder: "*****",
                            textColor: UIColor(named: "White")!,
                            placeholderColor: .gray,
                            font:  UIFont(name: "SF UI Display", size: 14) ?? UIFont(name: "Arial", size: 14)!, isSecureEntry: true, onFocusChange: { onFocus in
                                
                                onFocusLine3 = onFocus
                                
                            }
                        ).frame(height: 16)
                        Divider().background(onFocusLine3 == true ? Color("SecundaryColor"):Color("White"))
                        
                    }
                    
                    VStack {
                        
                        Button {
                            print("Registrate")
                            for family in UIFont.familyNames {
                                print("\(family)")
                                for name in UIFont.fontNames(forFamilyName: family) {
                                    print("   \(name)")
                                }
                            }
                        } label: {
                            Text("REGíSTRATE").frame(maxWidth: .infinity,alignment: .center).font(
                                Font.custom("SF UI Display", size: 18)
                                .weight(.bold)
                                )
                                .kerning(0.72)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.vertical,12)
                                .overlay(RoundedRectangle(cornerRadius:6.0).stroke(Color("SecundaryColor"), lineWidth: 1.0).shadow(color: Color("SecundaryColor"), radius: 6) )
                        }.frame(alignment: .center).padding(.top, 53)
                        
                        Text("Regístrate con redes sociales")
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
                    }
                    
                    
                    
                }.padding(.horizontal, 20)
                
                
            }
            
        
        
    }
    
    
    func checkCameraPermission(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            // User has granted permission
            completion(true)
        case .notDetermined:
            // Permission not determined, request access
            AVCaptureDevice.requestAccess(for: .video) { granted in
                completion(granted)
            }
        case .denied, .restricted:
            // Permission denied or restricted
            completion(false)
        @unknown default:
            completion(false)
        }
    }
}

#Preview {
    RegistView()
}
