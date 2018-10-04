//
//  AppTableViewCell.swift
//  AppStoreContent
//
//  Created by SE on 10/2/18.
//  Copyright © 2018 IT14146602. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {


    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    
    //Update UI Components when appDetail object is set
    var app:AppDetail! {
    didSet{
        self.updateUI()
    }
    }
    
    func updateUI()
    {
        appName.text = app.appName
        sellerName.text = app.seller! + " (App)"
        let url = URL(string: app.image!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.artworkImageView.image = UIImage(data: data!)
            }
        }
    }
}
