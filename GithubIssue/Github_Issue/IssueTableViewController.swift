//
//  IssueTableViewController.swift
//  Github_Issue
//
//  Created by sinze vivens on 2020/1/29.
//  Copyright © 2020 Luke. All rights reserved.
//
// Attribute: https://medium.com/swift2go/building-reusable-generic-uitableviewcontroller-in-ios-app-alfian-losari-cba0fded3740

import UIKit

class IssueTableViewController: UITableViewController {

    var issues = [GitHubIssue]()
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        //fatalError("Init() has not been implemented!")
    }
    
    init(issues: [GitHubIssue]) {
      self.issues = issues
      super.init(style: .plain)
      self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func viewDidLoad(openStatus: Bool) {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        GitHubClient.fetchReleases (isOpen: openStatus, completion: {releases, error in
            // ensure we have the good data
            guard let releases = releases, error == nil else {
                print(error!)
                return
            }

            for release in releases {
                self.issues.append(release)
            }
            self.tableView.reloadData()
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.rowHeight = 90
        })
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, identifier: String) -> UITableViewCell {
         let cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! IssueTableViewCell
        
        let headline = self.issues[indexPath.row]
        cell.titleLable?.text = headline.title
        cell.titleLable?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.nameLabel?.text = "@" + headline.user.login
        let img = UIImage(systemName: "envelope.open")!
        let tintableImage = img.withRenderingMode(.alwaysTemplate)
        cell.imgViewInCell.image = tintableImage
        cell.imgViewInCell.tintColor = UIColor.green
        
        return cell
    }
    
    func prepare(identifier: String, for segue: UIStoryboardSegue) {
        
        if segue.identifier == identifier{
             if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "MMMM d, yyyy"
                let date = dateFormatterGet.date(from: self.issues[indexPath.row].createdAt)
                
                let vc = segue.destination as! IssueDetailViewController
                vc.myIssueTitle = self.issues[indexPath.row].title!
                vc.myUsername = "@" + self.issues[indexPath.row].user.login
                vc.myDate = dateFormatterPrint.string(from: date!)
                vc.myText = self.issues[indexPath.row].body!
                vc.myStatus = true
                
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
