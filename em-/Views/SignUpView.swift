//
//  SignUpView.swift
//  em-
//
//  Created by Yen Le on 3/26/23.
//

import Foundation
import SwiftUI

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
        LogInView()
    }
}

struct SignUpView: View {
    
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State var signUpSuccess = false
    @State var DirectToLogIn = false
    
    // MARK: - View
    var body: some View {
        VStack(){
            if signUpSuccess{
                Home()
            }
            else if DirectToLogIn{
                LogInView()
            }
            else {
                settingButtons
            }
        }
    }
    
    var settingButtons: some View
    {
        VStack() {
            Text("EM-")
                .font(.custom("Bauziet", size: 30))
                .padding([.top, .bottom], 40)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: self.$email)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5) .stroke(Color.gray) )
                
                TextField("Password", text: self.$password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5) .stroke(Color.gray) )
                TextField("Name", text: self.$name)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5) .stroke(Color.gray) )
                
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                self.signUpSuccess = UserManager().createUser(email:email, name:name, password: password){
                    name in UserInSession.name = name
                }  
                
            }) {
                Text("sign up")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(Font.custom("Bauziet", size: 18))
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width:125, height: 50))
            }.padding(.top,50)
            
            VStack(){
                Text("Already have an account?").padding(.top, 50)
                Button(action: {
                        DirectToLogIn = true
                }){
                    Text("log in")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Bauziet", size: 18))
                        .foregroundColor(.black)
                        .padding()
                }.padding(.top,10)
            }
        }
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}
