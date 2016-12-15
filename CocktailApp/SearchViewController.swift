//
//  SearchViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 15/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recherche = searchBar.text!

        let url = "http://cocktail.api.anthony.sh/en/drinks/search?i[]=" + recherche
        
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print("success : \(value)")
                
                let json = JSON(value)
                
            
                
                
            case .failure(let error):
                print("error : \(error)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
