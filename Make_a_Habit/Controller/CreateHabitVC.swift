//
//  CreateHabitVC.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/18/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit

class CreateHabitVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var habitTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var habitType: HabitType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        habitTextView.delegate = self
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        habitType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        longTermBtn.titleLabel?.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5)
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        habitType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
        shortTermBtn.titleLabel?.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if habitTextView.text != "" && habitTextView.text != "What's the habit you want to make?" {
            guard let finishHabitVC = storyboard?.instantiateViewController(withIdentifier: "FinishHabitVC") as? FinishHabitVC else { return }
            finishHabitVC.initData(details: habitTextView.text!, type: habitType)
            presentingViewController?.presentSecondaryDetail(finishHabitVC)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        guard let habitsVC = storyboard?.instantiateViewController(identifier: "HabitsVC") as? HabitsVC else { return }
        presentingViewController?.goPreviousPage(habitsVC)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        habitTextView.text = ""
        habitTextView.textColor = view.backgroundColor?.isDarkColor == true ? .white : .black
    }
}
