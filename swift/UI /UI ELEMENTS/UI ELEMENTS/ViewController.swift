//
//  ViewController.swift
//  UI ELEMENTS
//
//  Created by mac on 6/24/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UITableViewController {
    var newsItem = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let url:String
        self.navigationController?.title = "NY TIMES"
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
                let obj = ["title": title, "abstract": abstract, "url":url]
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
        //let cell = ViewControllerCell
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let newsItems = newsItem[indexPath.row]
        cell.textLabel?.text = newsItems["title"]
        cell.detailTextLabel?.text = newsItems["abstract"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detailViewController()
        vc.detailNewsItem =  newsItem[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



