//
//  ViewController.swift
//  JSON2Table
//
//  Created by Stanislav on 27.03.2019.
//  Copyright © 2019 Stanislav Kozlov. All rights reserved.
//
//URL of json files in array DemoURLs.jsonFile[]
//json file from task DemoURLs.jsonFile[0]


import UIKit

class JSON2TableViewController: UITableViewController {
    
    let fileURL = DemoURLs.jsonFile[0]
    var pageTitle: String = "Main page"
    var jsonData: [JSONData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if jsonData == nil {
            loadJsonDataFromURL(loadDataFrom: fileURL)
        }
        self.navigationItem.title = pageTitle
        tableView.tableFooterView = UIView()
    }
// MARK: - Table view data source methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! JSON2TableViewCell
        cell.title?.text = jsonData?[indexPath.row].title ?? ""
        cell.content?.text = jsonData?[indexPath.row].body ?? ""
        if let categories = jsonData?[indexPath.row].categories {
            cell.accessoryType = categories.isEmpty ? .none : .disclosureIndicator
        }
        return cell
    }
    
   
   
//MARK: - TableView events methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let categories = jsonData?[indexPath.row].categories {
            if !categories.isEmpty {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "objectTable") as? JSON2TableViewController
                vc?.pageTitle = jsonData?[indexPath.row].title ?? ""
                vc?.jsonData = jsonData?[indexPath.row].categories
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        
    }
//MARK: - Custom methods
//Load data from json file to object of class JSONData synchronous
    private func loadJsonDataFromURL(loadDataFrom url: URL) {
        if let urlContent = try? String(contentsOf: url){
            if let inputData = urlContent.data(using: .utf8){
                if let data = try? JSONDecoder().decode(JSONData.self, from: inputData){
                    jsonData = [data]
//                    dump(data)
                } else {
                    print("Invalid JSON file: \(url)")
                }
            }
        } else {
            print("Error loading file: \(url)")
        }
    }
    
}

