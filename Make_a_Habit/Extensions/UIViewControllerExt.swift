//
//  UIViewControllerExt.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/14/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        dismiss(animated: true, completion: nil)
    }
}

