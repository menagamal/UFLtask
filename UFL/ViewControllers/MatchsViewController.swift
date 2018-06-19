//
//  MatchsViewController.swift
//  UFL
//
//  Created by Mena Gamal on 6/17/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MatchsViewController: UIViewController , IndicatorInfoProvider  , UIScrollViewDelegate , UITableViewDelegate , UITableViewDataSource {
    
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet var viewModel : ViewModel!
    
    var currentLeague:Leagues!
    
    var delegate:DidScrollDelegate!
    
    @IBOutlet weak var matchesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollview.delegate = self
        viewModel = ViewModel(league: currentLeague)
        
        
        matchesTableView.register(UINib(nibName: "MatchesTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchesTableViewCell")
        matchesTableView.delegate = self
        matchesTableView.dataSource = self
        
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        var indicator:IndicatorInfo!
        viewModel.league = currentLeague
        indicator = viewModel.getPageTitle()
        return indicator
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate.didScroll(scrollview: scrollView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMatchesCountInLeague()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.getCurrentCell(tableView: tableView, league: currentLeague, cellForRowAt: indexPath)
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return viewModel.getSectionsCount()
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return viewModel.getSectionsTitles(section: section)
//    }
//
    
    
}
