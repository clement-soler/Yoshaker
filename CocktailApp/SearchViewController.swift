//
//  SearchViewController.swift
//  CocktailApp
//
//  Created by Clement Soler on 15/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var tableViewsearch: UITableView!

    var dataLayer: TAGDataLayer = TAGManager.instance().dataLayer

    
    var searchActive : Bool = false
    var data = ["Whisky Buck","Peppermint Kiss","Arise My Love","Caipirissima","Amaretto Stone Sour","Papaya Surprise Smoothie","V.I.P Lime Mocktail"]
    var filtered:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLayer.push(["event": "eventGA", "eventCategory" : "user", "eventAction" : "clickOnSearchButton"]);
        
        dataLayer.push(["event": "eventGA", "eventCategory" : "user", "eventAction" : "clickOnSearch"]);
        
        dataLayer.push(["event": "openScreen", "screenName": "Search"]);
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        
        
        /* Setup delegates */
        tableViewsearch.delegate = self
        tableViewsearch.dataSource = self
        searchBar.delegate = self
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func
        searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: String = text as String
            let range = tmp.range(of: searchText, options:String.CompareOptions.backwards)
            return (range != nil)
//            let tmp: NSString = text as NSString
//            let range = tmp.range(of: searchText)
//            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableViewsearch.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewsearch.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell;
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row];
        }
        
        return cell;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
