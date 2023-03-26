//
//  EmojiMap.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import SwiftUI

struct EmojiMap: View {
    @Binding var emotion: String
    var size: CGFloat
    var body: some View {
        Image(emotion).resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
    }
}

struct EmojiMap_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
