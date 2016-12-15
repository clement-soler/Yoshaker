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

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var firstnameTextField: UILabel!
    @IBOutlet weak var lastnameTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userToken = LocaleStore.getUserToken()!
        
        let url = "http://cocktail.api.anthony.sh/en/user/me/" + userToken
        

        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print("success : \(value)")
                
                let json = JSON(value)
                
                let userfirstname = json["data"]["firstname"].stringValue
                self.firstnameTextField.text = userfirstname
                
                let userlastname = json["data"]["lastname"].stringValue
                self.lastnameTextField.text = userlastname
                
            case .failure(let error):
                print("error : \(error)")
            }
        }
        

        
    }

   

}
