//
//  ChatMessageCell.swift
//  MessageAppDemo
//
//  Created by User on 18/07/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    
    let messageLbl = UILabel()
    let bublebackgroundView = UIView()
    var leadingconstraint : NSLayoutConstraint!
    var trillingconstraint : NSLayoutConstraint!
    
    var chatmessageset : chatMessage!{
        didSet{
            bublebackgroundView.backgroundColor = chatmessageset
                .isIncoming ? .white : .darkGray
            messageLbl.textColor = chatmessageset.isIncoming ? .black : .white
            messageLbl.text = chatmessageset.text
            
            if chatmessageset.isIncoming {
                trillingconstraint.isActive = false
                leadingconstraint.isActive = true
                
            }else {
                trillingconstraint.isActive = true
                leadingconstraint.isActive = false
            }
            
        }
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        bublebackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bublebackgroundView)
        addSubview(messageLbl)
        
        bublebackgroundView.backgroundColor = .yellow
        bublebackgroundView.layer.cornerRadius = 12
        
        messageLbl.numberOfLines = 0
        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        //set some constraints to lable
        let constraints = [messageLbl.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                        messageLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
                        messageLbl.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bublebackgroundView.topAnchor.constraint(equalTo: messageLbl.topAnchor, constant: -16),
            bublebackgroundView.leadingAnchor.constraint(equalTo: messageLbl.leadingAnchor, constant: -16),
            bublebackgroundView.bottomAnchor.constraint(equalTo: messageLbl.bottomAnchor, constant: 16),
            bublebackgroundView.trailingAnchor.constraint(equalTo: messageLbl.trailingAnchor, constant: 16),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingconstraint =  messageLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingconstraint.isActive = false
        
        trillingconstraint = messageLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trillingconstraint.isActive = true
        
       
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
