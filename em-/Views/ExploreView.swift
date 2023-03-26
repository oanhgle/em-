//
//  ExploreView.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import SwiftUI

struct ExploreView: View {
    @State var emotion: String = "joy"
    @State var location: String = ""
    @State var events = [Event]()
    var size: CGFloat = 90
    var body: some View {
        ScrollView (.vertical){
            VStack{
                /*
                HStack {
                    HStack{
                        Image(systemName: "location")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.gray)
                        TextField(
                            "Current Location",
                            text: $location,
                            axis: .vertical
                        )
                    }
                    .padding(10)
                    .overlay(VStack{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.6))
                    })
                    .frame(width: 200)
                    .font(Font.custom("Bauziet-", size: 18))
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                .padding(.horizontal)
                */
                HStack(spacing: 25) {
                    VStack (alignment: .leading){
                        HStack(){
                            Image(systemName: "location.square")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            Text("Univ of South Florida").font(Font.custom("Bauziet", size: 15))
                                .offset(y:0)
                        }
                        Group {
                            Text("The Bull community is feeling ")
                            +
                            Text(emotion)
                            +
                            Text(" today.")
                        }
                        .font(Font.custom("Bauziet", size: 20))
                        .padding(.top, 10)
                    }
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    
                    EmojiMap(emotion: $emotion, size: size)
                        .offset(y:22)
                }
                .padding(.top, 90)
                .padding(.horizontal)
                .frame(height: 120)
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            // events explore
            
            VStack() {
                VStack(spacing: 25) {
                    HStack(){
                        Image(systemName: "star.square")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        Text("Explore").font(Font.custom("Bauziet", size: 15))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x:20)
                    
                    Text("Explore the events near by")
                        .font(Font.custom("Bauziet", size: 15))
                        .foregroundColor(.gray)
                        
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 0) {
                                ForEach(events) {
                                    event in EventItem(event: event)
                                }
                            }
                        }
                    }.offset(y:0)
                }
                .padding(.top, 100)
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            Spacer()
            RoundedRectangle(cornerRadius: 10).stroke(.white).frame(height: 200)
        }
        .onAppear() {
            API().loadEvents { (events) in
                self.events = events
            }
        }
    }
}


struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
