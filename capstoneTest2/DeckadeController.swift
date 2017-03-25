//
//  DeckadeController.swift
//  capstoneTest2
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class DeckadeController {
    
    static let baseUrl = URL(string: "https://api.cognitive.microsoft.com/bing/v5.0/images/search?")
    static let apiKey = "8a4c9444f22e4dc1b0828c309e4280e9"
    
    static func fetchMovie(for deckadeSearch: String, completion: @escaping ([Deckade]) -> Void) {
        
        guard let baseUrl = baseUrl else { completion([]); return }
        
        let urlParameters = ["q": deckadeSearch, "Ocp-Apim-Subscription-Key": apiKey]
        
        NetworkController.performRequest(for: baseUrl, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion([])
                return
            }
            
            guard let data = data,
                let jsonDictionaries = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else { completion([]); return }
            
            guard let deckadeArray = jsonDictionaries["value"] as? [[String: Any]] else { completion([]); return }
            
            let deckades = deckadeArray.flatMap( {Deckade(jsonDictionary: $0)})
            
            for deckade in deckades {
                ImageController.image(forURL: deckade.contentUrlString, completion: { (newImage) in
                    
                })
            }
            completion(deckades)
        }
    }
}
