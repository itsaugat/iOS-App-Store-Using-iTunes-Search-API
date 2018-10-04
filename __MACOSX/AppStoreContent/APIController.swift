//
//  APIController.swift
//  AppStoreContent
//
//  Created by SE on 10/2/18.
//  Copyright © 2018 IT14146602. All rights reserved.
//

import Foundation

class ApiController {
    
    var iosApps: [AppDetail] = []
    
    
    
    func getJsonFromUrl(url: URL, completion: @escaping ([AppDetail]?) -> Void)
    {
        
        //let jsonUrl = AppStoreEndPoint.search(term: "Puzzle")
        //let url = jsonUrl.request.url
        
        //creating a NSURL
        //let url = NSURL(string: String(describing: jsonUrl.request.url))
        //print(url!)
        
        iosApps.removeAll()
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
//                print(jsonObj!.value(forKey: "results")!)
                
                //getting the results tag array from json and converting it to NSArray
                if let appArray = jsonObj!.value(forKey: "results") as? NSArray {
                    //looping through all the elements
                    for app in appArray{
                        
                        //converting the element to a dictionary
                        if let appDict = app as? NSDictionary {
                            
                            //getting the name from the dictionary
                            let appName = appDict.value(forKey: "trackName")
                            let genre = appDict.value(forKey: "primaryGenreName")
                            let seller = appDict.value(forKey: "sellerName")
                            let image = appDict.value(forKey: "artworkUrl60")
                            let price = appDict.value(forKey: "formattedPrice")
                            let newApp:AppDetail = AppDetail(appName: appName as? String, genre: genre as? String, seller: seller as? String, image: image as? String, price: price as? String)
//                            print(newApp.appName!)
                            self.iosApps.append(newApp)
                            
                            
                        }
                    }
                }
        
                completion(self.iosApps)
            }
        }).resume()
        
            }
    
    
}
