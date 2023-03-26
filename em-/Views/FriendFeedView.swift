//
//  FriendFeedView.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import SwiftUI

struct FriendFeedView: View {
    var posts : [Journal]
    var body: some View {
        ScrollView{
            VStack(){
                VStack(spacing: 25) {
                    VStack(spacing: 20) {
                        ForEach(posts) {
                            post in PostView(post: post)
                            Divider().frame(maxWidth: 300) 
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
                .padding(.horizontal)
            }
        }
    }
}

struct FriendFeedView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
