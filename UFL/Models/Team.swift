//
//  Team.swift
//  UFL
//
//  Created by Mena Gamal on 6/17/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//

import Foundation
class Team {
    
    var id:Int!
    var name:String!
    
    init() {
        id = 0
        name = "Test Team"
    }
    
    init(id:Int,name:String) {
        self.id = id
        self.name = name
    }
    
}
