//
//  MatchesTableViewCell.swift
//  UFL
//
//  Created by Mena Gamal on 6/18/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelMatchTime: UILabel!
    @IBOutlet weak var labelAwayTeam: UILabel!
    @IBOutlet weak var labelHomeTeam: UILabel!
    @IBOutlet weak var viewIndicator: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDetails(match:Match, number:Int)  {
        
        if number % 2 == 0 {
            //FFD700
            viewIndicator.backgroundColor = UIColor(red: 0xFF / 255, green: 0xD7 / 255, blue: 0x00 / 255, alpha: 1)
        } else {
            //E5E4E2
            viewIndicator.backgroundColor = UIColor(red: 0xE5 / 255, green: 0xE4 / 255, blue: 0xE2 / 255, alpha: 1)
        }
        labelHomeTeam.text = match.homeTeam.name
        labelAwayTeam.text = match.awayTeam.name
        labelMatchTime.text = match.time
        
    }
    
    
}
