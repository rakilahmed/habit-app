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
    
    func configureCell(details: String, type: String, habitProgressAmount: Int) {
        self.habitDetails.text = details
        self.habitType.text = type
        self.habitProgress.text = String(describing: habitProgressAmount)
    }
    
}
