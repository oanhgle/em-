//
//  EmoAnnotation.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import MapKit
import SwiftUI

enum Emoji: Int {
    case joy
    case fear
    case disgust
    case neutral
    case anger
    case sadness
    case surprise
    func image() -> UIImage {
        switch self {
        case .joy:
            return UIImage(imageLiteralResourceName: "joy").resizeImageTo(size: CGSize(width: 48, height: 48))!
        case .fear:
            return UIImage(imageLiteralResourceName: "fear").resizeImageTo(size: CGSize(width: 48, height: 48))!
        case .disgust:
            return UIImage(imageLiteralResourceName: "disgust").resizeImageTo(size: CGSize(width: 48, height: 48))!
        case .anger:
            return UIImage(imageLiteralResourceName: "anger").resizeImageTo(size: CGSize(width: 48, height: 48))!
        case .sadness:
            return UIImage(imageLiteralResourceName: "sadness").resizeImageTo(size: CGSize(width: 48, height: 48))!
        case .surprise:
            return UIImage(imageLiteralResourceName: "surprise").resizeImageTo(size: CGSize(width: 48, height: 48))!
        case .neutral:
            return UIImage(imageLiteralResourceName: "neutral").resizeImageTo(size: CGSize(width: 48, height: 48))!
        }
    }
}

class EmoAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let type: Emoji
    let emotion: String
    init(
        coordinate: CLLocationCoordinate2D,
        title: String,
        subtitle: String,
        emotion: String
    ){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.emotion = emotion
        switch emotion {
            case "joy":
                self.type = Emoji.joy
            case "fear":
                self.type = Emoji.fear
            case "disgust":
                self.type = Emoji.disgust
            case "anger":
                self.type = Emoji.anger
            case "sadness":
                self.type = Emoji.sadness
            case "surprise":
                self.type = Emoji.surprise
            case "neutral":
                self.type = Emoji.neutral
            default:
                self.type = Emoji.neutral
        }
    }
}

extension UIImage {
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImg = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImg
    }
}
