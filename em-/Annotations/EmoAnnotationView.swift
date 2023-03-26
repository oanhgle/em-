//
//  EmoAnnotationView.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import MapKit

class EmoAnnotationView: MKAnnotationView {
  // 1
  // Required for MKAnnotationView
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  // 2
  override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    guard let EmoAnnotation = self.annotation as? EmoAnnotation else { return }

    image = EmoAnnotation.type.image()
  }
}
