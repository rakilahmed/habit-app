//
//  HabitsVC.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/13/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit
import CoreData

class HabitsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    @IBAction func addHabitBtnPressed(_ sender: Any) {
        guard let createHabitVC = storyboard?.instantiateViewController(identifier: "CreateHabitVC") else {
            return
        }
        presentDetail(createHabitVC)
    }
}

extension HabitsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell") as? HabitCell else {
            return UITableViewCell()
        }
        cell.configureCell(details: "Eat Salad", type: .shortTerm, habitProgressAmount: 2)
        return cell
    }
}
