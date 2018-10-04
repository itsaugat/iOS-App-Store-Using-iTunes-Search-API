//
//  PopUpViewController.swift
//  AppStoreContent
//
//  Created by Anjana S Porawagama on 10/4/2561 BE.
//  Copyright © 2561 BE IT14146602. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    //Declare variables for UI Components
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var compayLabel: UILabel!
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet var popBGView: UIView!
    @IBOutlet weak var popView: UIView!
    
    //Varibale to store AppDetail object
    var appData: AppDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI changes for Pop over box
        closeBtn.layer.cornerRadius = 0.5 * closeBtn.bounds.size.width
        typeLabel.layer.borderWidth = 2.0
        typeLabel.layer.cornerRadius = 5
        typeLabel.layer.borderColor = #colorLiteral(red: 0.07300766455, green: 0.7396874535, blue: 0.7980199353, alpha: 1)
        popView.layer.cornerRadius = 20
        
        
        //Touch event to close the pop over when touched out side the pop over
        let touch = UITapGestureRecognizer(target: self, action: #selector(PopUpViewController.closePopUp(_:)))
        self.popBGView.addGestureRecognizer(touch)
        
        
        //Selected app data binding to the UI components
        self.titleLabel.text = appData.appName
        let url = URL(string: appData.image!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.popImage.image = UIImage(data: data!)
            }
        }
        self.compayLabel.text = appData.seller
        self.appLabel.text = "App"
        self.genreLabel.text = appData.genre
        self.typeLabel.text = appData.formattedPrice
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Close the pop over
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}
