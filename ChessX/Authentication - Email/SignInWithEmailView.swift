//
//  SignInWithEmailView.swift
//  ChessX
//
//  Created by srivatsa davuluri on 13/03/24.
//

import SwiftUI
@MainActor
final class SignInWithEmailViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func userSignIn() {
        guard !email.isEmpty, !password.isEmpty else{
            print("No Email or Password Found")
            return
        }
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.createNewUser(email: email, password: password)
                print("Sucess")
                print(returnedUserData)
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}


struct SignInWithEmailView: View {
    @StateObject private var viewModel = SignInWithEmailViewModel()
    var body: some View {
        VStack{
            HStack{
                
                Text("dont have an account,")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                    .offset(CGSize(width: 20.0, height: -10))
                
                
                HStack {
                    Button(action: {}, label: {
                        Image("sign_up_button")
                        
                    })
                }.padding(.horizontal,17)
                    .padding(.top,-17)
                
                Spacer()
            }
            
            
            VStack(spacing: 5){
                
                VStack{
                    Image("email_container")
                        .overlay(
                            TextField("", text: $viewModel.email)
                                .autocapitalization(.none)
                                .padding(.horizontal)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                                .padding(.top,10)
                        )
                    
                    Image("password_container")
                        .overlay(
                            SecureField("", text: $viewModel.password)
                                .padding(.horizontal)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                                .padding(.top,10)
                        )
                    
                    HStack{
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("cant_sign_in")
                            })
                        }.padding(.horizontal,2)
                            .padding(.top,2)
                        
                        Spacer()
                    }.padding(.bottom,30)
                    
                    
                    
                    
                    Button(action: {
                        viewModel.userSignIn()
                    }, label: {
                        Image("signin_button")
                    }).padding(.top,20)
                    
                    Image("separator")
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("sign_up_google")
                            .padding()
                    })
                }.padding(.vertical,130)
                
            }.navigationTitle("Sign In")
                .padding(.horizontal)
                .padding(.vertical,130)
        }
        
        
    }
}

#Preview {
    NavigationStack{
        SignInWithEmailView()
        
    }
}
