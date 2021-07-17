//
//  CardCell.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/16/21.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var bigTitleLabel: UILabel!
    
    
    // set up the cell
    func configure(picture: UIImage, title: String, unit: String, hour: String, bigTitle: String) {
        pictureView.image = picture
        titleLabel.text = title
        unitLabel.text = unit
        hourLabel.text = hour
        bigTitleLabel.text = bigTitle
    }
}
