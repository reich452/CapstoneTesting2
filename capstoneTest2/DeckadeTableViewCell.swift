//
//  DeckadeTableViewCell.swift
//  capstoneTest2
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class DeckadeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var deckade: Deckade? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    func updateViews() {
        guard let deckade = deckade else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = deckade.imageName
            ImageController.image(forURL: deckade.contentUrlString, completion: { (deckadeImage) in
                self.deckadeImageView.image = deckadeImage
            })
        }
    }

    @IBOutlet weak var deckadeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
}
