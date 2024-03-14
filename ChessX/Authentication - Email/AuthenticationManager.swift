//
//  AuthenticationManager.swift
//  ChessX
//
//  Created by srivatsa davuluri on 13/03/24.
//

import Foundation
import FirebaseAuth




final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init(){ }
    
    // MARK: for existing user
    
    
    func getAuthenticatedUser() throws ->  AuthDataModel{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataModel(user: user)
    }
    
    // MARK: for new user
    
    func createNewUser (email: String, password: String) async throws -> AuthDataModel {
        let AuthDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataModel(user: AuthDataResult.user)
    }
    
    // MARK: for signing out user
    
    func signOutUser() throws {
        try Auth.auth().signOut()
    }
    
}


