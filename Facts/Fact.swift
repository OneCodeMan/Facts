//
//  Fact.swift
//  Facts
//
//  Created by Dave Gumba on 2016-12-12.
//  Copyright © 2016 Dave's Organization. All rights reserved.
//

import Foundation

struct Fact {
    
    let factText: String
    
    init(factData: [String: AnyObject]) {
        factText = factData["text"] as! String
    }
}
