//
//  ColorViewController.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/25/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Color]() {
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
        colors = ColorData.getColors()
    }
 

}

extension ColorViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let aColor = colors[indexPath.row]
        cell.textLabel?.text = aColor.name["value"]?.description
        cell.detailTextLabel?.text = aColor.hex["value"]
        return cell
    }
}
