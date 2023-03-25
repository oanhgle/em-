//
//  NoteView.swift
//  em-
//
//  Created by Oanh Le on 3/24/23.
//

import SwiftUI

struct NoteView: View {
    @Environment(\.dismiss) var dismiss
    @State var reply: String = ""
    @State var reply2: String = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack() {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 28))
                        .foregroundColor(.black)
                        .padding(.top, 20)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            HStack() {
                Image("pfp").resizable()
                    .frame(width: 100.0, height: 100.0)
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            HStack {
                Text("how are you today?")
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)
                    .font(Font.custom("Bauziet", size: 25))
                    .padding(.top, 20)
                    .padding(.horizontal)
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            HStack {
                TextField(
                    "watching netlix, coding...",
                    text: $reply
                )
                .overlay(VStack{Divider().offset(x: 0, y: 15)})
                .font(Font.custom("Bauziet-", size: 18))
                .padding(.top, 20)
                .padding(.horizontal)
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            HStack {
                Text("tell us more!")
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)
                    .font(Font.custom("Bauziet", size: 25))
                    .padding(.top, 20)
                    .padding(.horizontal)
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            HStack {
                TextField(
                    "today I did ...",
                    text: $reply2,
                    axis: .vertical
                )
                .lineLimit(7...10)
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 5) .stroke(Color.gray.opacity(0.3)) )
                .font(Font.custom("Bauziet-", size: 18))
                .padding(.top, 20)
                .padding(.horizontal)
            }
            .padding(.top, 3)
            .padding(.horizontal)
            HStack {
                Button {
                    // action
                    print("Button pressed")
                } label: {
                    Text("done")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Bauziet", size: 18))
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width:90, height: 50)
                    )
                }
            }
            .padding(.top, 20)
            .padding(.horizontal)
        }
        .offset(y:-25)
        .padding(.horizontal)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
