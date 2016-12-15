//
//  HomeViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 13/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class themeTableViewCell: UITableViewCell{
    @IBOutlet weak var glassImage: UIImageView!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
}

class HomeViewController: UITableViewController {
    
    var data = ["Birthday", "Father's Day", "Halloween", "Mother's Day", "New year","Thanksgiving", "Valentine's Day", "Wedding", "World's Cup"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let url = "http://cocktail.api.anthony.sh/en/drinks/theme"
//        
//        
//        Alamofire.request(url, method: .get).responseJSON { (response) in
//            switch response.result {
//            case .success(let value):
//                print("success : \(value)")
//                
//                let json = JSON(value)
//                let themename = json["data"]["theme"].stringValue
//                print(themename)
//                
//            case .failure(let error):
//                print("error : \(error)")
//            }
//        }
    
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! themeTableViewCell
        
        let element = data[indexPath.row]
        cell.themeLabel?.text = element
        cell.glassImage?.image = UIImage(named: element)
        
        return cell
    }

    
    
}
