//
//  MapView.swift
//  em-
//
//  Created by Oanh Le on 3/21/23.
//

import SwiftUI
import MapKit
import CoreLocation

let region = Location(filename: "CurrentLocation")
let mapView = MKMapView(frame: UIScreen.main.bounds)

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
            let latDelta = region.overlayTopLeftCoordinate.latitude - region.overlayBottomRightCoordinate.latitude
            
            let span = MKCoordinateSpan(latitudeDelta: fabs(latDelta), longitudeDelta: 0.0)
            let region = MKCoordinateRegion(center: region.midCoordinate, span: span)
            
            mapView.region = region
            mapView.delegate = context.coordinator
            
            return mapView
        }
        
        func updateUIView(_ uiView: MKMapView, context: Context) {
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
//                else if let character = overlay as? Character {
//                    let circleView = MKCircleRenderer(overlay: character)
//                    circleView.strokeColor = character.color
//                    return circleView
//                }
                
                return MKOverlayRenderer()
            }
            
//            func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//                let annotationView = AttractionAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
//                annotationView.canShowCallout = true
//                return annotationView
//            }
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

