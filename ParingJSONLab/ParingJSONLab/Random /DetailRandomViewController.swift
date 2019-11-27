//
//  DetailRandomViewController.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/26/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailRandomViewController: UIViewController {
    
    
    @IBOutlet weak var fullAddressText: UILabel!
    @IBOutlet weak var phoneNumberText: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    var random: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    func loadData() {
        guard let random = random else {
            fatalError()
        }
        phoneNumberText.text = "Phone number: \(random.phone)"
        dateOfBirth.text = "DOB: \(random.dob.date)"
        fullAddressText.text = fullAddress()
        
        ImageCLient.getImage(urlString: random.picture.large) { [unowned self] (result) in
            switch result {
            case .failure(let error):
                print("\(error)")
            case .success(let image):
                DispatchQueue.main.sync {
                    self.personImage.image = image
                }
        }
    }
    }
    
    func fullAddress () -> String {
        let fullAddress = "\(random!.location.street.number.description) \(random!.location.street.name) \(random!.location.city) \(random!.location.state) \(random!.location.country)"
        return fullAddress
    }
    
    


}
