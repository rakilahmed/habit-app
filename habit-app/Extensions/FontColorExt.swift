//
//  FontColorExt.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/18/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit

extension UIColor {
    // Changes font color baskd on the background, dark bg = white font | white bg = dark font!
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.50 ? true : false
    }
}
