//
//  RandomViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 15/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Nuke

class RandomViewController: UIViewController {
    
    var dataLayer: TAGDataLayer = TAGManager.instance().dataLayer

    @IBOutlet weak var themeNameTextField: UILabel!
    @IBOutlet weak var cocktailName: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var glassType: UILabel!
    @IBOutlet weak var degreeAlcol: UILabel!
    @IBOutlet weak var adult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLayer.push(["event": "openScreen", "screenName": "Random Cocktail"]);
        dataLayer.push(["event": "eventGA", "eventCategory" : "cocktail", "eventAction" : "clickOnCocktail"]);
        
        getJSON()

        // Do any additional setup after loading the view.
    }

    func getJSON(){
        
        let url = "http://cocktail.api.anthony.sh/en/drinks/drinks_random"
        
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print("success : \(value)")
                
                let json = JSON(value)
                
                let themename = json["data"]["theme"].stringValue
                self.themeNameTextField.text = themename
                
                let cocktailpic = json["data"]["pic"].stringValue
                Nuke.loadImage(with: URL(string: cocktailpic)!, into: self.cocktailImage)
                
                let cocktailname = json["data"]["name"].stringValue
                self.cocktailName.text = cocktailname
                
                let glassVerre = json["data"]["glass"].stringValue
                self.glassType.text = glassVerre
                
                let degreeAlcohol = json["data"]["degree"].stringValue
                self.degreeAlcol.text = degreeAlcohol
                
                var adultalcohol = json["data"]["is_alcoholic"].stringValue
                
                if adultalcohol == "0"{
                    self.adult.text = "no"
                }else{
                    self.adult.text = "yes"
                }
                
                
            case .failure(let error):
                print("error : \(error)")
            }
        }
    
    }
    
    @IBAction func randomButton(_ sender: AnyObject) {
        getJSON()
        
        dataLayer.push(["event": "eventGA", "eventCategory" : "cocktail", "eventAction" : "clickOnRandom"]);
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
