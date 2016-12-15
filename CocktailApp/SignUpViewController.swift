//
//  SignUpViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 13/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {
    

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.paddingTextField()
        passwordTextField.paddingTextField()
        firstnameTextField.paddingTextField()
        lastnameTextField.paddingTextField()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountAction(_ sender: AnyObject) {
        
        let url = "http://cocktail.api.anthony.sh/en/user/register"
        
        let parameters = [
            "firstname": firstnameTextField.text!,
            "lastname" : lastnameTextField.text!,
            "email" : emailTextField.text!,
            "password" : passwordTextField.text!
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                print(jsonData)
                self.performSegue(withIdentifier: "successRegister", sender: nil)
            case .failure(let error):
                print("error : \(error)")
            }
        }
        
    }

}

