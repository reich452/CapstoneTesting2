//
//  DeckadeTableViewController.swift
//  capstoneTest2
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class DeckadeTableViewController: UITableViewController, UISearchBarDelegate {
   
    @IBOutlet weak var deckadeSearch: UISearchBar!
    
    // MARK: - Properties
    
    var deckades: [Deckade] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        deckadeSearch.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchTerm = searchBar.text else { return }
        
        DeckadeController.fetchMovie(for: searchTerm) { (newDeckade) in
            DispatchQueue.main.async {
                self.deckades = newDeckade
            }
        }
    }


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return deckades.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deckadeCell", for: indexPath) as? DeckadeTableViewCell else { return UITableViewCell() }
        
        let deckade = deckades[indexPath.row]
        
        cell.deckade = deckade
        
        return cell
    }
}
