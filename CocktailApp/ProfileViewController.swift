//
//  ProfileViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 14/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Nuke

class ProfileViewController: UIViewController {
    

    var dataLayer: TAGDataLayer = TAGManager.instance().dataLayer
    
    
    @IBOutlet weak var firstnameTextField: UILabel!
    
    @IBOutlet weak var ImageCocktailProfilFirst: UIImageView!
    @IBOutlet weak var nameCocktailFirst: UILabel!
    @IBOutlet weak var themeFirst: UILabel!
    @IBOutlet weak var themeSecond: UILabel!
    @IBOutlet weak var nameCocktailSecond: UILabel!
    @IBOutlet weak var ImageCocktailProfilSecond: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLayer.push(["event": "openScreen", "screenName": "Profile"]);
        
        let userToken = LocaleStore.getUserToken()!
        
        let url = "http://cocktail.api.anthony.sh/en/user/me/" + userToken
        

        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print("success : \(value)")
                
                let json = JSON(value)
                
                let userfirstname = json["data"]["firstname"].stringValue
                self.firstnameTextField.text = userfirstname
                
            case .failure(let error):
                print("error : \(error)")
            }
        }
        
        
        let urlrandom = "http://cocktail.api.anthony.sh/en/drinks/drinks_random"
        
        
        Alamofire.request(urlrandom, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print("success : \(value)")
                
                let json = JSON(value)
                
                //1
                let themeF = json["data"]["theme"].stringValue
                self.themeFirst.text = themeF
                
                let themeS = json["data"]["theme"].stringValue
                self.themeSecond.text = themeS
                //2
                let cocktailpicF = json["data"]["pic"].stringValue
                Nuke.loadImage(with: URL(string: cocktailpicF)!, into: self.ImageCocktailProfilFirst)
                
                let cocktailpic = json["data"]["pic"].stringValue
                Nuke.loadImage(with: URL(string: cocktailpic)!, into: self.ImageCocktailProfilSecond)
                //3
                let cocktailF = json["data"]["name"].stringValue
                self.nameCocktailFirst.text = cocktailF
                
                let cocktailS = json["data"]["name"].stringValue
                self.nameCocktailSecond.text = cocktailS
                
    
            case .failure(let error):
                print("error : \(error)")
            }
        }
        

        
    }

   

}
