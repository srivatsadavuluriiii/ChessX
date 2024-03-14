//
//  RootView.swift
//  ChessX
//
//  Created by srivatsa davuluri on 13/03/24.
//

import SwiftUI

struct RootView: View {
    @State private var showSignedInView: Bool = false
    var body: some View {
        ZStack{
            NavigationStack{
                Text("Settings")
                
            }.onAppear{
                let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
                self.showSignedInView = authUser == nil ? true : false
            }
        }.fullScreenCover(isPresented: $showSignedInView, content: {
            NavigationStack{
                AuthenticationView()
            }
        })
    }
}

#Preview {
    RootView()
}
