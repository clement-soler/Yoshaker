//
//  TextField+Extension.swift
//  CocktailApp
//
//  Created by Clement Soler on 14/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit

extension UITextField {
    
    func paddingTextField() {
     
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        self.leftView = paddingView;
        self.leftViewMode = UITextFieldViewMode.always
        
    }
    
}
