//
//  SigninViewmodel.swift
//  Login Feature
//
//  Created by ousmane diouf on 2/19/23.
//

import Foundation
import SwiftUI

class SignInViewModel: ObservableObject {
    ///everytime this value changes it is going to be stored in userdefault under the hood because we sepecified the key by using the appstorage
    @AppStorage("AUTH_KEY") var isAuthenticated = false {
        willSet {objectWillChange.send()} // we need to tell the program that this object will change
    }
    ///  when the user logs out we want to remember the username, remembers the user name upon logout
    @AppStorage("USER_KEY") var username = "username"
    
    @Published var password = "password"
    @Published var invalidCredentials = false
    
    // stub data used to compare with the password and the username to make sure things are working properly
    private var sampleUser = "username"
    private var samplePassword = "password"
    
    init() {
        print("currently logged on \(isAuthenticated)")
        print("current user \(username)")
    }
    
    func toggleAuthentication() {
        self.password = "" //resets the password because we do not want to store it anywhere in our program
        
        withAnimation {
            isAuthenticated.toggle()
        }
    }
    
    func authenticate() {
        guard self.username.lowercased() == samplePassword else {
            self.invalidCredentials = true
            return
        }
        
        guard self.password.lowercased() == samplePassword else { // using lowercased so that there sint no case sensitivity
            self.invalidCredentials = true
            return
        }
        
        toggleAuthentication()
    }
    
    func logout() {
        toggleAuthentication()
    }
    
    func buttonPressed() {
        print("we can execute an action here")
    }
    
    
}

