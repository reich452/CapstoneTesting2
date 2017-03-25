//
//  Deckade.swift
//  capstoneTest2
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import UIKit

class Deckade {
    
    private let nameKey = "name"
    private let contentUrlKey = "contentUrl"
    
    let imageName: String
    let contentUrlString: String
    
    var imagePath: UIImage?
    
    var imageUrl: URL? {
        return URL(string: contentUrlString)
    }
    
    init?(jsonDictionary: [String:Any]) {
        guard let imageName = jsonDictionary[nameKey] as? String,
        let imageUrl = jsonDictionary[contentUrlKey] as? String
        
            else { return nil }
        
        self.imageName = imageName
        self.contentUrlString = imageUrl
    }
}
