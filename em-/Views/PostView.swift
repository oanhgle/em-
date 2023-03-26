//
//  PostView.swift
//  em-
//
//  Created by Oanh Le on 3/26/23.
//

import SwiftUI

struct PostView: View {
    var post: Journal
    @State var users = [User]()
    @State var user_name: String = ""
    
    @State var colorCircle: [Color] = [.red.opacity(0.4), .green.opacity(0.4), .purple.opacity(0.4), .blue.opacity(0.4)]
    
    var body: some View {
        VStack(alignment:.leading){
            HStack(){
                Circle()
                    .fill(colorCircle.randomElement()!)
                    .frame(width: 60.0, height: 50.0)
                    .padding(5)
                    .offset(x:4)
                    .overlay(Image(systemName: "person")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .offset(x:4))
                VStack(alignment:.leading){
                    Text("Anonymous")
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
//        .onAppear {
//            API().getUserName(user_id: post.user_id) { user_name in
//                self.user_name = user_name
//            }
//        }
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
