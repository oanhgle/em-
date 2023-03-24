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
            
            Text("Coco")
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black)
                .font(.custom("Lexend-Bold", size: 32))
                .padding(.top, 20)
                .padding(.horizontal)
            
            Text("Welcome back!")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black.opacity(0.5))
                .font(.custom("Lexend-Bold", size: 18))
                .padding(.horizontal, 50)
                .padding(.vertical)
            
            Spacer()
            HStack {
                Image(systemName: "location.north.circle.fill")
                    .font(.system(size: 16))
                Text("Union Square")
                    .font(.custom("Lexend-Medium", size: 16))
            }.padding(.horizontal)

            HStack {
                Text("Your community is feeling happy today")
                          .font(.custom("Lexend-Semibold", size: 24))

                Spacer()
                Image("smile").resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .padding(.horizontal)
            .padding(.top, 10)
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
