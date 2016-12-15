//
//  BarmanViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 15/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit

class BarmanViewController: UIViewController {


    @IBOutlet weak var numberTextField: UITextField!
  

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.paddingTextField()
        nameTextField.paddingTextField()
        cityTextField.paddingTextField()

        // Do any additional setup after loading the view.
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
