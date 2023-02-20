//
//  ContentView.swift
//  Login Feature
//
//  Created by ousmane diouf on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        if viewModel.isAuthenticated {
            VStack {
                Text("Welcome back **\(viewModel.username.lowercased())**!")
                
                Button("Log out", action: viewModel.logout)
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
            }
            
        } else {
            ZStack {
                VStack(alignment: .leading, spacing:  20) {
                    Spacer()
                    
                    Text("Log In")
                        .padding(.leading, 16)
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .heavy, design: .serif))
                    
                    TextField("Username", text: $viewModel.username)
                        .padding([.leading, .trailing], 16)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding([.leading, .trailing], 16)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    
                    HStack {
                        Spacer()
                        
                        Button("Forgot Password", action: viewModel.buttonPressed)
                            .tint(.green)
                            .buttonStyle(.borderedProminent)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        
                        Spacer()
                        
                        Button("Log in", action: viewModel.authenticate)
                            .tint(.green)
                            .buttonStyle(.borderedProminent)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .alert("Access Denied", isPresented: $viewModel.invalidCredentials) {
                    Button("Dismiss", action: viewModel.buttonPressed)
                }

            }
            .transition(.offset(x:0, y: 850))
            .background(Image("sevenEleven2"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
