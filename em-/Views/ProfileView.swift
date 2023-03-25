//
//  ProfileView.swift
//  em-
//
//  Created by Oanh Le on 3/21/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack() {
                Image(systemName: "sparkles")
                    .font(.system(size: 28))
                Spacer()
                Image("pfp").resizable()
                    .frame(width: 100.0, height: 100.0)
                Spacer()
                Image(systemName: "bell.badge")
                    .font(.system(size: 26))
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            Text("Hey, Coco")
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black)
                .font(.custom("Bauziet", size: 32))
                .padding(.top, 20)
                .padding(.horizontal)
            
            Text("Welcome back ✌🏼")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black.opacity(0.5))
                .font(.custom("Lexend-Bold", size: 18))
                .padding(.horizontal)
                .padding(.top, 1)
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 300, height: 100)
                    .offset(y:20)
                HStack(alignment: .center, spacing: 30) {
                    Image("wallet").resizable()
                        .frame(width: 100.0, height: 100.0)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Balance")
                            .font(.custom("Bauziet-", size: 15))
                            .padding(.top, 20)
                            .foregroundColor(.gray)
                        Text("$19,081")
                            .font(.custom("Bauziet", size: 30))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
                }
                .padding(20)
                .padding(.top, 20)
                .padding(.horizontal)
            }
            HStack(alignment: .center, spacing: 10) {
                Button {
                    // action
                    print("Deposit pressed")
                } label: {
                    Text("deposit")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Bauziet", size: 18))
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width:125, height: 50)
                    )
                }
                Button {
                    // action
                    print("Send pressed")
                } label: {
                    Text("send")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Bauziet", size: 18))
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width:125, height: 50)
                    )
                }
            }
            .padding(10)
            .padding(.top, 10)
            .padding(.horizontal)
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
