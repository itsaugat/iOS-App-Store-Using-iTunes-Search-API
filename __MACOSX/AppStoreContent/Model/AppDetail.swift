//
//  AppDetail.swift
//  AppStoreContent
//
//  Created by SE on 10/2/18.
//  Copyright © 2018 IT14146602. All rights reserved.
//

import Foundation

struct AppDetail {
    
    var appName: String?
    var genre: String?
    var seller: String?
    var image: String?
    
    init(appName: String?, genre: String?, seller: String?, image: String?) {
        
        self.appName = appName
        self.genre = genre
        self.seller = seller
        self.image = image
        
    }
}
