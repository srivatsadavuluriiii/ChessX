//
//  AuthenticationView.swift
//  ChessX
//
//  Created by srivatsa davuluri on 13/03/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack{
            
            NavigationLink{
                SignInWithEmailView()
            } label: {
                Text("Sign In with Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
        }.navigationTitle("Sign In")
            .padding(.horizontal)
    }
}

#Preview {
    NavigationStack{
        AuthenticationView()
    }
}
