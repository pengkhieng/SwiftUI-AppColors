//
//  LoginData.swift
//  dwf-ios
//
//  Created by Khieng on 28/2/23.
//

import Foundation

class LoginData : ObservableObject {
    @Published var isLogin : Bool {
        didSet {
            UserDefaults.standard.set(isLogin, forKey: "login")
        }
    }
    
    init(){
        self.isLogin = false
    }
    
    
}
