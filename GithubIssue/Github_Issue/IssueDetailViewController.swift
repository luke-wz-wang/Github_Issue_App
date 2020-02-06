//
//  IssueDetailViewController.swift
//  Github_Issue
//
//  Created by sinze vivens on 2020/1/26.
//  Copyright © 2020 Luke. All rights reserved.
//


import UIKit

class IssueDetailViewController: UIViewController {

    @IBOutlet weak var issueTitle: UILabel!
    @IBOutlet weak var issueUser: UILabel!
    @IBOutlet weak var issueDate: UILabel!
    @IBOutlet weak var issueStatus: UIImageView!
    @IBOutlet weak var issueDetails: UITextView!
    
    var myIssueTitle: String = "initial"
    var myUsername: String = "initial"
    var myDate : String = "None"
    var myImg : UIImage = UIImage()
    var myStatus: Bool = true
    var myText: String = "initial"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if myStatus == false{
            myImg = UIImage(systemName: "envelope")!
        }else{
            myImg = UIImage(systemName: "envelope.open")!
        }
        let tintableImage = myImg.withRenderingMode(.alwaysTemplate)
        myImg = tintableImage
        
        issueTitle.text = myIssueTitle
        issueUser.text = myUsername
        issueDate.text = myDate
        issueStatus.image = myImg
        issueStatus.tintColor = UIColor.green
        issueDetails.text = myText
        //issueDetails.isUserInteractionEnabled = false
        //issueDetails.isScrollEnabled = true
        issueDetails.isEditable = false
        
        issueTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
