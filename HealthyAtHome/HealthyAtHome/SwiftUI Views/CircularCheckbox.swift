//
//  CircularCheckbox.swift
//  HealthyAtHome
//
//  Created by Sarah Ramsey on 7/20/21.
//

import UIKit

final class CircularCheckbox: UIView {
    
    private var isChecked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func toggle() {
        self.isChecked = !isChecked
        
        if self.isChecked {
            backgroundColor = .systemGray
        }
        else {
            backgroundColor = .systemBackground
        }
        
    }
}
