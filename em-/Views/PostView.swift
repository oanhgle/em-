//
//  PostView.swift
//  em-
//
//  Created by Oanh Le on 3/26/23.
//

import SwiftUI

struct PostView: View {
    var post: Journal
    var body: some View {
        VStack(alignment:.leading){
            HStack(){
                Image("pfp").resizable()
                    .frame(width: 80.0, height: 80.0)
                VStack(alignment:.leading){
                    Text(post.user_id)
                        .font(Font.custom("Bauziet", size: 20))
                    
                    Text(post.title)
                        .font(Font.custom("Bauziet-", size: 15))
                        .offset(y:5)
                }
                Spacer()
                Image(post.sentiment).resizable()
                    .frame(width: 40.0, height: 40.0)
            }
            .padding(0)
            .padding(.horizontal)
            
            HStack{
                Text(post.journal)
                    .font(Font.custom("Bauziet-", size: 15))
                    .padding(2)
            }
            .padding(10)
            .padding(.horizontal)
        }
        .padding(.top, 5)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
