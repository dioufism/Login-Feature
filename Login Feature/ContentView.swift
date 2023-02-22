//
//  ContentView.swift
//  Login Feature
//
//  Created by ousmane diouf on 2/18/23.
//

import SwiftUI
import Alchemy

struct ContentView<Model>: View where Model: AuthProtocol & AuthLayer  {
    @StateObject var auth: Model
    
    var backgroundImage: Image = Image("sevenEleven2")
    
    var body: some View {
        if $auth.isAuthenticated.wrappedValue {
            authenticatedView
            
        } else {
            ZStack {
                VStack(alignment: .leading, spacing:  20) {
                    Spacer()
                    
                    loginView
                    
                    buttons
                
                    Spacer()
                }
                .alert("Access Denied", isPresented: .constant($auth.invalidCredentials.wrappedValue)) {
                    Button("Dismiss", action: auth.buttonPressed)
                }

            }
            .transition(.offset(x:0, y: 850))
            .background(backgroundImage)
        }
    }
    
    var authenticatedView: some View {
        VStack {
            Text("Welcome back **\($auth.username.wrappedValue.lowercased())**!")
            
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
            .textFieldStyle(CustomTextFieldStyle())
        
        SecureField("Password", text: $auth.password)
            .textFieldStyle(CustomTextFieldStyle())
            .privacySensitive()
    }
    
    var buttons: some View {
        HStack {
            Spacer()
            
            Button("Forgot Password", action: auth.buttonPressed)
                .buttonStyle(FilledButton())
            
            Spacer()
            
            Button("Log in", action: auth.authenticate)
                .buttonStyle(FilledButton())
            
            Spacer()
        }
    }
    
    // Custom modifier that allows to abstract the style of our buttons
    struct FilledButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration
                .label
                .font(Font.title3)
                .fontWeight(Font.Weight.semibold)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(15)
        }
    }
    
    // Custom modifier that allows to abstract the style of our textFiels
    struct CustomTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
                .padding([.leading, .trailing], 16)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(auth: AuthLayer())
    }
}
