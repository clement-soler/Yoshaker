//
//  LoginViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 13/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.paddingTextField()
        passwordTextField.paddingTextField()
    
    }
    
    
    @IBAction func loginAccountAction(_ sender: AnyObject) {
        
        let url = "http://cocktail.api.anthony.sh/en/user/login"
        
        let parameters = [
            "email" : emailTextField.text!,
            "password" : passwordTextField.text!
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                let userToken = jsonData["data"]["token"].stringValue
                LocaleStore.setUser(token: userToken)
                self.performSegue(withIdentifier: "successLogin", sender: nil)
            case .failure(let error):
                print("error : \(error)")
            }
        }
        
    }

    
    
}
