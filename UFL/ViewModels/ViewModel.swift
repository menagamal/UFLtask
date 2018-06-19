//
//  ViewModel.swift
//  UFL
//
//  Created by Mena Gamal on 6/18/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewModel: NSObject {

    var matches = [Match]()
    
    var league:Leagues!
    
    var sections = ["ChampionsLeague","EuropeLeague","ItalianLeague","LaLiga","Ligue1","PremiearLeague","SaudiArabiaLeague"]
    
    
    override init() {
        
    }
     init(league:Leagues!) {
        
        for i in 0...100 {
            let match = Match()
            match.id = i
            match.time = "16:00"
            match.league = Leagues.randomLeagues()
            matches.append( match)
        }
        
        self.league = league
        
    }
    
    func getPageTitle() -> IndicatorInfo {
        var indicator:IndicatorInfo!

        switch league {
       
        case .ChampionsLeague:
           indicator = IndicatorInfo(title: "ChampionsLeague", image: UIImage(named: "champions-league-icon"))
             // indicator = IndicatorInfo(image: UIImage(named: "champions-league-icon"))
            break
        case .EuropeLeague:
            
            indicator = IndicatorInfo(title: "EuropeLeague", image: UIImage(named: "EuropaContest"))
            break
        case .ItalianLeague:
            indicator = IndicatorInfo(title: "ItalianLeague", image: UIImage(named: "ItalyBadge"))
            break
        case .LaLiga:
            indicator = IndicatorInfo(title: "LaLiga", image: UIImage(named: "SpainContest"))
            
            break
        case .Ligue1:
            indicator = IndicatorInfo(title: "Ligue1", image: UIImage(named: "FranceContest"))
            
            break
        case .PremiearLeague:
            indicator = IndicatorInfo(title: "PremiearLeague", image: UIImage(named: "england"))
            
            break
        case .SaudiArabiaLeague:
            indicator = IndicatorInfo(title: "SaudiArabiaLeague", image: UIImage(named: "saudicontest"))
            
            break
        case .ALL :
            indicator = IndicatorInfo(title: "All", image: UIImage(named: "mlscontest"))
            break
        default:
            break
        }
        return indicator
    }
    
  
    
    func getMatchesCountInLeague() -> Int {
        if league == .ALL {
            return matches.count
        }
        let leagueMatchs = matches.filter { (match) -> Bool in
            match.league == league
        }
        
        
        return leagueMatchs.count
    }
    
    func getMatchesInLeague() -> [Match] {
        if league == .ALL {
            return matches
        }
        
        let leagueMatchs = matches.filter { (match) -> Bool in
            match.league == league
        }
        
        return leagueMatchs
    }
    
    func getCurrentCell (tableView:UITableView,league:Leagues,cellForRowAt indexPath: IndexPath) -> UITableViewCell   {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableViewCell", for: indexPath) as! MatchesTableViewCell
        
        if league == .ALL {
            cell.setDetails(match: matches[indexPath.row],number: indexPath.row)

        } else {
            let leagueMatchs = matches.filter { (match) -> Bool in
                match.league == league
            }
            
            cell.setDetails(match: leagueMatchs[indexPath.row],number: indexPath.row)
        }
        
       
        return cell
    }
    
}
