//
//  SettingViewController.swift
//  Instagram
//
//  Created by 樋川雄飛 on 2019/07/19.
//  Copyright © 2019 Yuhi Hikawa. All rights reserved.
//

import UIKit
import ESTabBarController
import Firebase
import SVProgressHUD

class SettingViewController: UIViewController {

    @IBOutlet weak var displayNameTextField: UITextField!
    
    @IBAction func handleChangeButton(_ sender: Any) {
    }
    
    @IBAction func handleLogoutButton(_ sender: Any) {
        
        // ログアウトする
        try! Auth.auth().signOut()
        
        // ログイン画面を表示する
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.present(loginViewController!, animated: true, completion: nil)
        
        // ログイン画面から戻ってきた時のためにホーム画面（index = 0）を選択している状態にしておく
        let tabBarController = parent as! ESTabBarController
        tabBarController.setSelectedIndex(0, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 表示名を取得してTextFieldに設定する
        let user = Auth.auth().currentUser
        if let user = user {
            displayNameTextField.text = user.displayName
        }
    }
}
