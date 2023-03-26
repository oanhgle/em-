//
//  CustomTabBar.swift
//  em-
//
//  Created by Oanh Le on 3/21/23.
//
import SwiftUI
import MapKit
import CoreLocation

struct CustomTabBar: View {
    @Binding var selectedTab: String
    var currentLocation: CLLocation!
    // Animation namespace for sliding effect
    @Namespace var animation
    @State var showNoteView = false
    var body: some View {
        HStack(spacing: 0) {
            // Tab Bar Button
            TabBarButton(animation: animation, image: "house", selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "heart", selectedTab: $selectedTab)
            
            Button(action: {
                self.showNoteView.toggle()
            }, label: {
                Image(systemName: "pencil")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.black)
                    .clipShape(Circle())
                // Shadows
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
            })
            .offset(y: -30)
            .fullScreenCover(isPresented: $showNoteView){ NoteView(currentLocation: currentLocation)
            }

            TabBarButton(animation: animation, image: "map", selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "person", selectedTab: $selectedTab)
        }
        .padding()
        .padding(.bottom)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extending view to get safe area..
extension View {
    var safeArea: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
}
 
struct TabBarButton: View {
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String

    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color.black : Color.gray.opacity(0.5))
                if selectedTab == image {
                    Circle()
                        .fill(.black)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 6, height: 6)
                }
            }
        }).frame(maxWidth: .infinity)
    }
}
