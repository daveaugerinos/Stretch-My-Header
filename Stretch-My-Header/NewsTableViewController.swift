//
//  NewsTableViewController.swift
//  Stretch-My-Header
//
//  Created by Dave Augerinos on 2017-03-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var newsItems = [NewsItem]()
    
    private let kTableHeaderHeight:CGFloat = 200
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self.dateLabel.text = currentDate()
        self.dateLabel.textColor = UIColor.white
        
        self.headerView = self.tableView.tableHeaderView
        self.tableView.tableHeaderView = nil;
        self.tableView.addSubview(self.headerView)
        self.headerView.frame.origin = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        self.tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        self.tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        newsItems = prepareData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        // Hide the navigation bar for current view controller
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.isNavigationBarHidden = false;
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Set Identifier
        let cellIdentifier = "categoryCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsTableViewCell else {
            fatalError("The dequeued cell is not an instance of NewsTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let newsItem = newsItems[indexPath.row]
        
        // Configure the cell
        cell.configureNewsCell(with: newsItem)

        return cell
    }

    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
//        print("contentOffset: \(self.tableView.contentOffset.y)")
        updateHeaderView()
    }


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }


    // MARK: - Private Methods -
    
    func prepareData() -> [NewsItem] {
        
        let newsItem1 = NewsItem(category: .world, headline: "Climate change protests, divestments meet fossil fuels realities")
        let newsItem2 = NewsItem(category: .americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let newsItem3 = NewsItem(category: .europe, headline: "'One million babies' created by EU student exchanges")
        let newsItem4 = NewsItem(category: .middleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let newsItem5 = NewsItem(category: .africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let newsItem6 = NewsItem(category: .asiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        
        let dataArray = [newsItem1, newsItem2, newsItem3, newsItem4, newsItem5, newsItem6]
        
        return dataArray
    }
    
    func currentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let currentDate = dateFormatter.string(from: Date())
        
        return currentDate
    }
    
    func updateHeaderView() {

        if(self.tableView.contentOffset.y < -kTableHeaderHeight) {
            
            self.headerView.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: self.tableView.contentOffset.y)
            self.tableView.setNeedsLayout()
        }
    }
}
