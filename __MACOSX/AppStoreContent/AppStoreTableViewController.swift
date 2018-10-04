//
//  AppStoreTableViewController.swift
//  AppStoreContent
//
//  Created by SE on 10/2/18.
//  Copyright © 2018 IT14146602. All rights reserved.
//

import UIKit

class AppStoreTableViewController: UITableViewController, UISearchBarDelegate {
    
    // Search Bar Controller
    @IBOutlet weak var searchBar: UISearchBar!
    
    var apps:[AppDetail]?
    var api = ApiController()
    
    var isSearching = false
    
    struct Storyboard {
        static let appCell = "AppCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fetchApps()
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
//        searchBar.text = "Hello world"
        print("Hello world")
    }
    
    func fetchApps(searchText: String)
    {
        let jsonUrl = AppStoreEndPoint.search(term: searchText)
        let url = jsonUrl.request.url
        api.getJsonFromUrl(url: url!) { (apps) in
            self.apps = apps
            print(self.apps!)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let apps = apps {
            return apps.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.appCell, for: indexPath) as! AppTableViewCell

        cell.app = apps?[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }
    
    // Modal Popup when clicking on a table row/cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as! AppTableViewCell
        
        let currentItem = currentCell.sellerName.text
        
        print(currentItem!)
        
        let sb = UIStoryboard(name: "PopUp", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! PopUpViewController
        popup.appData = apps?[(indexPath?.row)!]
        self.present(popup, animated: true)
        
    }
    
    // When user starts searching for specific apps
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            apps?.removeAll()

        } else {
            isSearching = true
            apps?.removeAll()
            let searchText = searchBar.text
            fetchApps(searchText: searchText!)

        }
    }
    
    
    


}
