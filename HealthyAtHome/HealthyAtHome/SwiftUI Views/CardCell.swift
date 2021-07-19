//
//  CardCell.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/16/21.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    // set up the cell
    func configure(picture: UIImage, title: String, unit: String, hour: String) {
        circleImage.image = picture
        titleLabel.text = title
        unitLabel.text = unit
        hourLabel.text = hour
    }
}
