//
//  AuthDataModel.swift
//  ChessX
//
//  Created by srivatsa davuluri on 13/03/24.
//

import Foundation
import FirebaseAuth


struct AuthDataModel {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

