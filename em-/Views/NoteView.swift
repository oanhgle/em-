//
//  NoteView.swift
//  em-
//
//  Created by Oanh Le on 3/24/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct NoteView: View {
    @Environment(\.dismiss) var dismiss
    var currentLocation: CLLocation!
    @State var reply: String = ""
    @State var reply2: String = ""
    @State var journal_id: String = ""
    @State var sentiment: String = ""
    @State var presentPopup = false
    
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
                    if (!reply.isEmpty && !reply2.isEmpty) {
//                        let latitude = "\(currentLocation.coordinate.latitude)"
//                        let longitude = "\(currentLocation.coordinate.longitude)"
                        let latitude = "28.05878"
                        let longitude = "-82.41531"
                        print(latitude)
                        let timestamp = Date()
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        let posted_time = formatter.string(from: timestamp)
//                        let journal = Journal(journal_id:UUID().uuidString, user_id:"532130b1-e064-48ad-838c-7409d6a42970", title: reply, journal: reply2)
//                        Api().createJournal(journal: journal)
//                        self.journal_id = journal.journal_id
                        // Create effect after this
                        presentPopup = true
                    } else {
                        print("Nothing entered")
                    }
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
                .fullScreenCover(isPresented: $presentPopup) {
                    VStack{
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 50))
                            .foregroundColor(.green)
                            .padding(.top, 20)
                            .padding(.horizontal)

                        Text("Thank you for journaling :) You are feeling \(self.sentiment).")
                            .font(Font.custom("Bauziet", size: 18))
                            .foregroundColor(.black)
                            .padding()

                        Button{
                            dismiss()
                        } label: {
                            Text("back")
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
//                    .onAppear() {
//                        Api().getJournal(journal_id: journal_id) { pred in
//                            self.sentiment = pred.sentiment
//                        }
//                    }
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
        Home()
    }
}
