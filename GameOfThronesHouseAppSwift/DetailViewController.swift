//
//  DetailViewController.swift
//  GameOfThronesHouseAppSwift
//
//  Created by Hau Hoang on 2023-08-11.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatOfArmsTextView: UITextView!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    
    var houseInfo: HouseInfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if houseInfo == nil {
            houseInfo = HouseInfo(name: "",region: "",coatOfArms: "",words: "")
        }
        updateUserInterface()
    }
    
    func updateUserInterface() {
        nameLabel.text = houseInfo.name
        wordsLabel.text = houseInfo.words
        
        if wordsLabel.text != "" {
            wordsLabel.text = "\"\(houseInfo.words)\""
        }
        
        regionLabel.text = houseInfo.region
        regionImageView.image = UIImage(named: houseInfo.region)
        coatOfArmsTextView.text = houseInfo.coatOfArms
        
        if coatOfArmsLabel.text == "" {
            coatOfArmsLabel.isHidden = true
        }
        
    }
}
