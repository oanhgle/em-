//
//  MapView.swift
//  em-
//
//  Created by Oanh Le on 3/21/23.
//

import SwiftUI
import MapKit
import CoreLocation

let mapView = MKMapView(frame: UIScreen.main.bounds)

struct MapView: UIViewRepresentable {
    var currentLocation: CLLocation!
    var posts : [Journal]
    func makeUIView(context: Context) -> MKMapView {
        
        /* get user's current location */
//        let coordinate = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let coordinate = CLLocationCoordinate2D(latitude: 28.05878, longitude: -82.41531)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.region = region
        mapView.delegate = context.coordinator
         
        /* display emojis */
        for item in posts {
            mapView.addAnnotation(EmoAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(item.latitude) ?? 28.05878, longitude: Double(item.longitude) ?? -82.41531), title: item.title, subtitle: "anonymous", emotion: item.sentiment))
                        
        }
//        let annotation = EmoAnnotation(coordinate: CLLocationCoordinate2D(latitude: 28.05878, longitude: -82.41531), title: "hey", subtitle: "hihi", type: Emoji.joy)
//        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
    }
    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay is MKPolyline {
                let lineView = MKPolylineRenderer(overlay: overlay)
                lineView.strokeColor = .green
                return lineView
            } else if overlay is MKPolygon {
                let polygonView = MKPolygonRenderer(overlay: overlay)
                polygonView.strokeColor = .magenta
                return polygonView
            }
            return MKOverlayRenderer()
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = EmoAnnotationView(annotation: annotation, reuseIdentifier: "EmoAnnotation")
            annotationView.canShowCallout = true
            return annotationView
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

