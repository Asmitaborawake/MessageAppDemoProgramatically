//
//  ViewController.swift
//  MessageAppDemo
//
//  Created by User on 18/07/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

struct chatMessage {
    let text : String
    let isIncoming : Bool
    let date : Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        
        let dateformater = DateFormatter()
        dateformater.dateFormat = "MM/dd/yyyy"
        return dateformater.date(from: customString) ?? Date()
       
    }
}

class ViewController: UITableViewController {
    fileprivate let cellid = "cell"
    
    let chatMessages = [
        [
            chatMessage(text:"here is my 1st text message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
            chatMessage(text:"i am going to send long message that going to be word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018"))
        ],
        
        [
            chatMessage(text:"i am going to send long message that going to be word wrap and many more lines come, i am going to send long message that going to be word wrap and many more lines come hi ios devslopers", isIncoming: false , date: Date.dateFromCustomString(customString: "09/15/2018")),
            chatMessage(text:"here is my 1st text message", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018"))
        ],
        
        
        [
            chatMessage(text:"here is my 1st text message here is my 1st text message here is my 1st text message here is my 1st text message here is my 1st text message", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018")),
            chatMessage(text:"here is my 1st text message", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles  = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellid)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    
    class dateHeaderLabel : UILabel{
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .green
            textColor = .red
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false // enalbe auytolayout
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        override var intrinsicContentSize: CGSize{
            font = UIFont.boldSystemFont(ofSize: 14)
            let originalSize = super.intrinsicContentSize
            let height = originalSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            
            return CGSize(width: originalSize.width + 20, height: height)
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first{
            
            let dateformater = DateFormatter()
            dateformater.dateFormat = "MM/dd/yyyy"
            let dateString = dateformater.string(from: firstMessageInSection.date)
            
            
            
            let label = dateHeaderLabel()
            label.text = dateString
            
            let contenerView = UIView()
            contenerView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: contenerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: contenerView.centerYAnchor).isActive = true
            
            return contenerView
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! ChatMessageCell
        
        let message = chatMessages[indexPath.section][indexPath.row]
        cell.chatmessageset = message
        
        return cell
    }
    
    
}

