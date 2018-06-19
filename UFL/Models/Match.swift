//
//  Match.swift
//  UFL
//
//  Created by Mena Gamal on 6/17/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//

import Foundation


public enum Leagues :UInt32 {
    case LaLiga , PremiearLeague , Ligue1 , ChampionsLeague , SpanishLeague,WorldCup , ItalianLeague , SaudiArabiaLeague , EuropeLeague , ALL
    
    private static let _count: Leagues.RawValue = {
        // find the maximum enum value
        var maxValue: UInt32 = 0
        while let _ = Leagues(rawValue: maxValue) {
            maxValue += 1
        }
        return maxValue
    }()
    
    static func randomLeagues() -> Leagues {
        // pick and return a new value
        let rand = arc4random_uniform(_count)
        return Leagues(rawValue: rand)!
    }
    
    
}

class Match {
    
    var id:Int!
    var time:String!
    var homeTeam = Team()
    var awayTeam = Team()
    var league:Leagues!
    
    init() {
        
        homeTeam.name = "Man U."
        awayTeam.name = "Southampt"
        
    }
    
    
}
