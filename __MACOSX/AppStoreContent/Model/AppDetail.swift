//
//  AppDetail.swift
//  AppStoreContent
//
//  Created by SE on 10/2/18.
//  Copyright © 2018 IT14146602. All rights reserved.
//

import Foundation

//Model to map the Json Object
struct AppDetail {
    
    var appName: String?
    var genre: String?
    var seller: String?
    var image: String?
    var formattedPrice: String?
    
    init(appName: String?, genre: String?, seller: String?, image: String?, price: String?) {
        
        self.appName = appName
        self.genre = genre
        self.seller = seller
        self.image = image
        self.formattedPrice = price
        
        
    }
}
