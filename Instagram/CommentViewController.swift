//
//  CommentViewController.swift
//  Instagram
//
//  Created by 樋川雄飛 on 2019/08/02.
//  Copyright © 2019 Yuhi Hikawa. All rights reserved.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    
    var postData:PostData!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func commentButton(_ sender: UIButton) {
        
        if let com = textField.text, let name = Auth.auth().currentUser?.displayName {
            
            let comment = "\(name) : \(com)"
            
            postData.comments.append(comment)
            
            let postRef = Database.database().reference().child(Const.PostPath).child(postData!.id!)
            
            let comments = ["comments": postData.comments]
            
            postRef.updateChildValues(comments)
            
            
        };UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
}
