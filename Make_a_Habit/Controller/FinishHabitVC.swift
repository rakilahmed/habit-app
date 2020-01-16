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
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let habit = Habit(context: managedContext)
        
        habit.habitDetails = habitDetail
        habit.habitType = habitType.rawValue
        habit.habitCompletion = Int32(pointsTextField.text!)!
        habit.habitProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
