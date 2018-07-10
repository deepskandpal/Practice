//
//  ViewController.swift
//  basicCell
//
//  Created by mac on 6/28/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SDWebImage

private let refreshControl =  UIRefreshControl()

class ViewController: UITableViewController {
    var newsItem = [[String:String]]()
    
    if #available(iOS 10.0, *) {
    .refreshControl = refreshControl
    } else {
    addSubview(refreshControl)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        let url:String
        navigationItem.title = "NY Times Most Popular"
        url = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=1bdd7e3e3c9b4e2aba6689c50f43b6b0"
        if let url = URL(string: url) {
            if let data = try?String (contentsOf: url){
                let json = JSON(parseJSON: data)
                if json["status"] == "OK" {
                    parse(json: json)
                }
            }
        }
    }
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let abstract = result["abstract"].stringValue
            let url = result["url"].stringValue
            let byline = result["byline"].stringValue
            let date =  result["published_date"].stringValue
            let obj = ["title": title, "abstract": abstract, "url":url,"byline":byline,"date":date]
            newsItem.append(obj)
        }
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsItems = newsItem[indexPath.row]
        let cell:TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
      //  let url = URL(string: "https://static01.nyt.com/images/2018/07/02/world/02mexico-top/02mexico-top-thumbStandard.jpg")
        cell.header.text = newsItems["title"]
        cell.abstract.text = newsItems["abstract"]
        cell.date.text = newsItems["date"]
        cell.byLine.text = newsItems["byline"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detailViewController()
        vc.detailNewsItem =  newsItem[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

