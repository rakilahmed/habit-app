//
//  FinishHabitVC.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/15/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit
import CoreData

class FinishHabitVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var makeHabitBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var habitDetail: String!
    var habitType: HabitType!
    
    func initData(details: String, type: HabitType) {
        self.habitDetail = details
        self.habitType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeHabitBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    
    @IBAction func makeHabitBtnPressed(_ sender: Any) {
        // Pass date into core date Habit model
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        
    }
}
