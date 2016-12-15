//
//  HomeViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 13/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit
import Alamofire
import Nuke
import SwiftyJSON


class themeTableViewCell: UITableViewCell{
    @IBOutlet weak var glassImage: UIImageView!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
}

class HomeViewController: UITableViewController {
    
    @IBOutlet weak var NavigationBar: UINavigationItem!
    
    var themeTitle = [String]()
    var backgroundImage = [String]()
    var glassImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view, typically from a nib.
        
        getJSON()
        
    }
    
    func getJSON(){
        
        let url = "http://cocktail.api.anthony.sh/en/drinks/theme"
        
        Alamofire.request(url, method: .get).responseJSON { (Response) -> Void in
            
            if let value = Response.result.value {
                
                let json = JSON(value)
                
                for anItem in json["data"].array! {
                    
                    let title: String? = anItem["theme"].stringValue
                    self.themeTitle.append(title!)
                    
                    let bgimage: String? = anItem["bg"].stringValue
                    self.backgroundImage.append(bgimage!)
                    
                    let glimage: String? = anItem["glass"].stringValue
                    self.glassImage.append(glimage!)
                }
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.themeTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! themeTableViewCell
        
        cell.themeLabel?.text =  themeTitle[indexPath.row]
        Nuke.loadImage(with: URL(string: backgroundImage[indexPath.row])!, into: cell.backgroundImage)
        Nuke.loadImage(with: URL(string: glassImage[indexPath.row])!, into: cell.glassImage)

        return cell
    }

    
    
}
