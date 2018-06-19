//
//  ViewController.swift
//  UFL
//
//  Created by Mena Gamal on 6/17/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController , DidScrollDelegate{
    
    var headerHeight: CGFloat!

    let minHeaderHeight = CGFloat(2)
    var containerViewRect: CGRect!

    func didScroll(scrollview: UIScrollView) {
        
        let offset = scrollview.contentOffset.y

        let height = headerHeight - offset
        
        if height > minHeaderHeight {
            if height < 90 {
                
                buttonBarView.frame = CGRect(origin: buttonBarView.frame.origin, size: CGSize(width:  buttonBarView.frame.width, height:  height ))
                
              //  self.containerView.frame = containerViewRect
               // self.containerView.frame.origin = containerViewRect.origin
                
 
            }
        } else {
             buttonBarView.frame = CGRect(origin: buttonBarView.frame.origin, size: CGSize(width:  buttonBarView.frame.width, height:  minHeaderHeight ))
            
//            var containerViewRect = self.containerView.frame
//            containerViewRect.origin = buttonBarView.frame.origin
//            containerViewRect.size.height = minHeaderHeight
//            self.containerView.frame = containerViewRect
//
        }
       
    }

    
   

    
    
    @IBOutlet weak var tabBarHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
            //headerHeight = tabBarHeight.constant
        headerHeight = 50
        
        
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.selectedBarHeight = 1
        
        settings.style.buttonBarItemFont = .systemFont(ofSize: 10)
        
        settings.style.selectedBarBackgroundColor = .white
        
        settings.style.buttonBarMinimumInteritemSpacing?.addProduct(5, 5)
        
       settings.style.buttonBarBackgroundColor = UIColor(red: 0x03 / 255, green: 0x31 / 255, blue: 0x56 / 255, alpha: 1)
        
        changeCurrentIndexProgressive = { (oldCell, newCell, progress, changeCurrent, animated) in
            
            if changeCurrent {
                //033156
                oldCell?.label.textColor =  .white
                newCell?.label.textColor =  .white
                
                oldCell?.backgroundColor = UIColor(white: 1, alpha: 0.0)
                newCell?.backgroundColor = UIColor(white: 1, alpha: 0.0)
            }
        }
        
        super.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, didSelectItemAt: indexPath)
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let All = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        All.delegate = self
        All.currentLeague = Leagues.ALL
        
        let PremiearLeague = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        PremiearLeague.delegate = self
        PremiearLeague.currentLeague = Leagues.PremiearLeague
        
        let EuropeLeague = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        EuropeLeague.delegate = self
        EuropeLeague.currentLeague = Leagues.EuropeLeague
        
        let ItalianLeague = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        ItalianLeague.delegate = self
        ItalianLeague.currentLeague = Leagues.ItalianLeague
        
        
        let LaLiga = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        LaLiga.delegate = self
        LaLiga.currentLeague = Leagues.LaLiga
        
        let Ligue1 = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        Ligue1.delegate = self
        Ligue1.currentLeague = Leagues.Ligue1
        
        let ChampionsLeague = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        ChampionsLeague.delegate = self
        ChampionsLeague.currentLeague = Leagues.ChampionsLeague
        
        let SaudiArabiaLeague = storyboard!.instantiateViewController(withIdentifier: "MatchsViewController") as! MatchsViewController
        SaudiArabiaLeague.delegate = self
        SaudiArabiaLeague.currentLeague = Leagues.SaudiArabiaLeague
     
        
        
        
      
        return [All,PremiearLeague,EuropeLeague,ItalianLeague,LaLiga,Ligue1,ChampionsLeague,SaudiArabiaLeague]
        
    }
    
    
    
}

