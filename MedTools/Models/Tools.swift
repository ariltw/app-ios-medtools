//
//  Tools.swift
//  MedTools
//
//  Created by Ariel on 17/12/20.
//

import Foundation
import ImageSlideshow

struct Tool {
    var id: Int
    var name: String
    var imageName: String
    
    var inputSource: InputSource {
        return ImageSource(image: UIImage(named: imageName)!)
    }
}
