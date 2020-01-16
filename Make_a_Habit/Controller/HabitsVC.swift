//
//  HabitsVC.swift
//  Make_a_Habit
//
//  Created by Rakil Ahmed on 1/13/20.
//  Copyright © 2020 Rakil Ahmed. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class HabitsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var habits: [Habit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetch { (complete) in
            if complete {
                if habits.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
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
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell") as? HabitCell else {
            return UITableViewCell()
        }
        
        let habit = habits[indexPath.row]
        
        cell.configureCell(habit: habit)
        
        return cell
    }
}

extension HabitsVC {
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchReq = NSFetchRequest<Habit>(entityName: "Habit")
        
        do {
            habits = try managedContext.fetch(fetchReq)
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
       
        
    }
}
