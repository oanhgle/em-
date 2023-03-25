//
//  ExploreView.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import SwiftUI

struct ExploreView: View {
    @State var events = [Event]()
    var body: some View {
        Text("Explore")
            .padding()
            .onAppear() {
                Api().loadData { (events) in
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
