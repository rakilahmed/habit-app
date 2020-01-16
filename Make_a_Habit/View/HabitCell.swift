//
//  HabitCell.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/13/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit

class HabitCell: UITableViewCell {
    @IBOutlet weak var habitDetails: UILabel!
    @IBOutlet weak var habitType: UILabel!
    @IBOutlet weak var habitProgress: UILabel!
    
    func configureCell(habit: Habit) {
        self.habitDetails.text = habit.habitDetails
        self.habitType.text = habit.habitType
        self.habitProgress.text = String(describing: habit.habitProgress)
    }
    
}
