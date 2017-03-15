//
//  NewsItem.swift
//  Stretch-My-Header
//
//  Created by Dave Augerinos on 2017-03-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

// News categories
struct NewsItem {
    
    let category: Category
    let categoryColour: UIColor
    var headline: String?

    enum Category: String {
        
        case world = "World"
        case americas = "Americas"
        case europe = "Europe"
        case middleEast = "Middle East"
        case africa = "Africa"
        case asiaPacific = "Asia Pacific"
    }
    
    init(category: Category, headline: String) {
        
        self.headline = headline
        self.category = category
        
        switch category {
        case .world:
            categoryColour = UIColor.red
        case .americas:
            categoryColour = UIColor.blue
        case .europe:
            categoryColour = UIColor.green
        case .middleEast:
            categoryColour = UIColor.yellow
        case .africa:
            categoryColour = UIColor.orange
        case .asiaPacific:
            categoryColour = UIColor.purple
        }
    }
}
