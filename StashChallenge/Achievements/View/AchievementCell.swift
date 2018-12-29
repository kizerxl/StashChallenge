//
//  AchievementCell.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/28/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit
import Kingfisher

class AchievementCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lvlLbl: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var progessLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!

    @IBOutlet weak var progessView: UIProgressView!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adjustCell()
    }

    func configure(achievement: Achievement) {
        let progress = achievement.progress
        let total = achievement.total
        
        lvlLbl.text = achievement.level
        progessLbl.text = "\(progress)pts"
        totalLbl.text = "\(total)pts"
        progessView.progress = Float(progress)/Float(total)
        imgView.kf.setImage(with: URL(string: achievement.bg_image_url))
        
        adjustVisualAccessibility(achievement: achievement)
    }
    
    func adjustVisualAccessibility(achievement: Achievement) {
        self.contentView.layer.opacity = achievement.accessible ? 1.00 : 0.50
    }
    
    private func adjustCell() {
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.clipsToBounds = true

        progessView.layer.cornerRadius = 5
        progessView.clipsToBounds = true

        progessView.layer.sublayers![1].cornerRadius = 5
        progessView.subviews[1].clipsToBounds = true

        imgView.layer.borderWidth = 1
        imgView.layer.cornerRadius = 3
        imgView.layer.borderColor = Color.clear.cgColor
        imgView.layer.masksToBounds = true
        
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backView.layer.shadowRadius = 10
        backView.layer.shadowColor = Color.black.cgColor
        backView.layer.masksToBounds = false
    }
}
