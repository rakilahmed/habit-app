//
//  UIBtnExt.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/14/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit

extension UIButton {
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.5)
    }
}
