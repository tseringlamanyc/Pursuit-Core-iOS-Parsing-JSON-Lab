//
//  DetailColorViewController.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/26/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailColorViewController: UIViewController {
    
    
    @IBOutlet weak var hexText: UILabel!
    @IBOutlet weak var redText: UILabel!
    @IBOutlet weak var blueText: UILabel!
    @IBOutlet weak var greenText: UILabel!
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        hexText.text = "Hex value: \(color.hex["clean"] ?? "")"
        redText.text = "Red \(String(format: "%.1f", color.rgb.r / 255).description)"
        blueText.text = "Blue \(String(format: "%.1f", color.rgb.b / 255).description)"
        greenText.text = "Green \(String(format: "%.1f", color.rgb.g / 255).description)"
    }
    

   

}
