//
//  OpenIssueTableViewController.swift
//  Github_Issue
//
//  Created by sinze vivens on 2020/1/26.
//  Copyright © 2020 Luke. All rights reserved.
//

import UIKit

// Refactored
class OpenIssueTableViewController: IssueTableViewController {
    
    //var issues = [GitHubIssue]()

    override func viewDidLoad() {
        super.viewDidLoad(openStatus: true)
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return super.tableView(tableView, cellForRowAt: indexPath, identifier: "OpenTableCell")
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(identifier: "openSegue", for: segue)
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = self.tableView.dequeueReusableCell(withIdentifier: "OpenTableCell", for: indexPath) as! IssueTableViewCell
//
//        let headline = self.issues[indexPath.row]
//        cell.titleLable?.text = headline.title
//        cell.titleLable?.font = UIFont.boldSystemFont(ofSize: 18)
//        cell.nameLabel?.text = "@" + headline.user.login
//        let img = UIImage(systemName: "envelope.open")!
//        let tintableImage = img.withRenderingMode(.alwaysTemplate)
//        cell.imgViewInCell.image = tintableImage
//        cell.imgViewInCell.tintColor = UIColor.green
//        //cell.imageView?.image = UIImage(named: "open")
//
//        return cell
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "openSegue"{
//             if let indexPath = self.tableView.indexPathForSelectedRow {
//
//                let dateFormatterGet = DateFormatter()
//                dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//                let dateFormatterPrint = DateFormatter()
//                dateFormatterPrint.dateFormat = "MMMM d, yyyy"
//                let date = dateFormatterGet.date(from: self.issues[indexPath.row].createdAt)
//
//                let vc = segue.destination as! IssueDetailViewController
//                vc.myIssueTitle = self.issues[indexPath.row].title!
//                vc.myUsername = "@" + self.issues[indexPath.row].user.login
//                vc.myDate = dateFormatterPrint.string(from: date!)
//                vc.myText = self.issues[indexPath.row].body!
//                vc.myStatus = true
//
//            }
//        }
//    }
    
    

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
