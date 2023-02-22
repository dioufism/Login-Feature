//
//  ContentView.swift
//  Login Feature
//
//  Created by ousmane diouf on 2/18/23.
//

import SwiftUI
import Alchemy

struct ContentView: View {
    @StateObject var auth = AuthLayer()
    
    var body: some View {
        if auth.isAuthenticated {
            authenticatedView
            
        } else {
            ZStack {
                VStack(alignment: .leading, spacing:  20) {
                    Spacer()
                    
                    loginView
                    
                    buttons
            
                    Spacer()
                }
                .alert("Access Denied", isPresented: $auth.invalidCredentials) {
                    Button("Dismiss", action: auth.buttonPressed)
                }

            }
            .transition(.offset(x:0, y: 850))
            .background(Image("sevenEleven2"))
        }
    }
    
    var authenticatedView: some View {
        VStack {
            Text("Welcome back **\(auth.username.lowercased())**!")
            
            Button("Log out", action: auth.logout)
                .tint(.green)
                .buttonStyle(.borderedProminent)
        }
    }
    
    @ViewBuilder
    var loginView: some View {
        Text("Log In")
            .padding(.leading, 16)
            .foregroundColor(.white)
            .font(.system(size: 50, weight: .heavy, design: .serif))
        
        TextField("Username", text: $auth.username)
            .padding([.leading, .trailing], 16)
            .textFieldStyle(.roundedBorder)
            .textInputAutocapitalization(.never)
        
        SecureField("Password", text: $auth.password)
            .padding([.leading, .trailing], 16)
            .textFieldStyle(.roundedBorder)
            .textInputAutocapitalization(.never)
            .privacySensitive()
    }
    
    var buttons: some View {
        HStack {
            Spacer()
            
            Button("Forgot Password", action: auth.buttonPressed)
                .tint(.green)
                .buttonStyle(.borderedProminent)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            
            Spacer()
            
            Button("Log in", action: auth.authenticate)
                .tint(.green)
                .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
