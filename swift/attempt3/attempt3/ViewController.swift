//
//  ViewController.swift
//  attempt3
//
//  Created by RIL on 6/17/18.
//  Copyright © 2018 Deepanshu. All rights reserved.
//

//
//  ViewController.swift
//  attempt2(json parsing)
//
//  Created by RIL on 6/17/18.
//  Copyright © 2018 Deepanshu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tableArray = [String] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        parseJson()
    }
    
    func parseJson (){
        let url = URL (string: "https://api.myjson.com/bins/vi56v")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard error == nil else {
                print("returned error")
                return
            }
            guard let content = data else {
                print("No data")
                return
            }
            guard let json = (try? JSONSerialization.jsonObject(with: content , options:JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                print("No containing JSON")
                return
            }
            if let array = json["companies"] as? [String]{
                self.tableArray = array
            }
           print(self.tableArray)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
            
        }
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension  ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = self.tableArray[indexPath.row]
        return cell
    }
}
