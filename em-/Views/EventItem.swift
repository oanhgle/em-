//
//  EventItem.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import SwiftUI

struct EventItem: View {
    var event: Event
    
    var body: some View {
        let from_date_index = event.from_time.index(event.from_time.startIndex, offsetBy: 10)
        let to_date_index = event.to_time.index(event.to_time.startIndex, offsetBy: 10)
        let from_date = event.from_time[..<from_date_index]
        let to_date = event.to_time[..<to_date_index]
        let end = event.from_time.index(event.from_time.endIndex, offsetBy: -3)
        let time_index = event.to_time.index(event.to_time.startIndex, offsetBy: 11)
        let range = time_index..<end
        let from_time = event.from_time[range]
        let to_time = event.to_time[range]
        HStack{
            VStack(alignment: .leading) {
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text(event.name)
                                .font(Font.custom("Bauziet", size: 17))
                        }.frame(width:200, height:70,alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        Spacer()
                        Image(systemName: "bookmark.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(.yellow)
                        
                    }
                    HStack(spacing:15){
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.gray)
                            .offset(x:2)
                        Text(event.location)
                            .foregroundColor(.gray)
                            .font(Font.custom("Bauziet-", size: 15))
                    }
                    .frame(width:250, height: 15, alignment: .leading)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    HStack(spacing:15){
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.gray)
                            .offset(x:2)
                        Text(from_date).foregroundColor(.gray)
                            .font(Font.custom("Bauziet-", size: 15))
                    }
                    HStack(spacing:15){
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.gray)
                            .offset(x:2)
                        Text(from_time + " - " + to_time).foregroundColor(.gray)
                            .font(Font.custom("Bauziet-", size: 15))
    
                    }
                    
                    HStack{
                        Text(event.tags)
                            .font(Font.custom("Bauziet-", size: 15))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 5) .fill(.purple.opacity(0.6)))
                    }
                      
                }.padding(10)
            }
            .offset(x:5)
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.6)).offset(y:-5))
        }.padding(10)
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
