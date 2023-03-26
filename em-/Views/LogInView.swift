//
//  LogInView.swift
//  em-
//
//  Created by Yen Le on 3/26/23.
//

import Foundation

import SwiftUI

struct UserInSession{
    static var name = ""
    static var privateKey = ""
    static var secretKey = ""
}
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().environmentObject(UserManager())
    }
}

struct LogInView: View {
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    @State var LogInSuccess = false
    @State var DirectToSignUp = false
    @EnvironmentObject var userAuth: UserManager
    @State var events = [String]()
    // MARK: - View
    var body: some View {
        VStack(){
            if LogInSuccess{
                Home().environmentObject(UserManager())
            }
            else if DirectToSignUp{
                SignUpView()
            }
            else {
                settingButtons
            }
        }
    }
    
    var settingButtons : some View {
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
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                self.LogInSuccess = UserManager().loginUser(email:email, password: password){
                    name in
                    UserInSession.name = name
                }
                    
            }){
                Text("log in")
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
                Text("Don't have an account?").padding(.top, 50)
                Button(action: {
                    DirectToSignUp = true
                }){
                    Text("sign up")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Bauziet", size: 18))
                        .foregroundColor(.black)
                        .padding()
                }.padding(.top,10)
            }
        }
    }
}

