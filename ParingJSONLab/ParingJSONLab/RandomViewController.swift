//
//  RandomViewController.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/25/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var person = [Person]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self

    }
    
    func loadData() {
        person = PersonData.getPerson()
    }

}

extension RandomViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let people = person[indexPath.row]
        cell.textLabel?.text = "\(people.name["first"] ?? "") \(people.name["last"] ?? "")"
        cell.detailTextLabel?.text = people.email
        return cell
    }
}
