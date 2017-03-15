//
//  NewsTableViewCell.swift
//  Stretch-My-Header
//
//  Created by Dave Augerinos on 2017-03-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    func configureNewsCell(with newsItem: NewsItem) {
        
        categoryLabel.text = newsItem.category.rawValue
        categoryLabel.textColor = newsItem.categoryColour
        headlineLabel.text = newsItem.headline
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
