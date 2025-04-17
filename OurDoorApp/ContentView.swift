//
//  ContentView.swift
//  OurDoorApp
//
//  Created by Nikola Grdanoski on 13.4.25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import NavigationTransitions

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isPresenting = false
    @State var userIsSignedIn = false
    
    var body: some View {
        /*VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()*/
        
        NavigationStack {
            Text("OurDoor")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 50.0)
            .padding(.top, 100.0)
                
            TextField("Email", text: $email)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.purple)
            .textFieldStyle(.roundedBorder)
            .padding()
                
            SecureField("Password", text: $password)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.purple)
            .textFieldStyle(.roundedBorder)
            .padding()
                
            NavigationLink(destination: TenantView(), isActive: self.$userIsSignedIn, label: {
                Button("Sign In") {
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        print("in sign in")
                        if error != nil {
                            print("Alert")
                        }
                        else {
                            print("Log in")
                            userIsSignedIn = true
                        }
                    }
                }
            })
            .foregroundStyle(.white)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
            .background(.purple)
            .clipShape(.rect(cornerRadius: 7))
            .padding()
            .navigationBarBackButtonHidden()
                
            NavigationLink(destination: TenantView(), isActive: self.$isPresenting, label: {
                Button ("Sign Up") {
                    if (email.isEmpty || password.isEmpty) {
                        print("Empty")
                    }
                    else {
                        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                            if error != nil {
                                print("Alert")
                            }
                            else {
                                print("Sign up success!")
                                let req = Auth.auth().currentUser?.createProfileChangeRequest()
                                req?.displayName = "Tenant"
                                req?.commitChanges(completion: nil)
                                isPresenting = true
                            }
                        }
                    }
                }
            })
            .foregroundStyle(.purple)
            .padding()
            .navigationBarBackButtonHidden()
            
                
            Spacer()
                
            NavigationLink("See President Screen", destination: PresidentSignInView())
                    .foregroundStyle(.white)
                    .buttonStyle(.bordered)
                    .background(.purple)
                    .clipShape(.rect(cornerRadius: 7))
                    .padding()
                    .navigationTransition(.fade(.in).animation(.easeInOut(duration: 0.5)))
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .statusBarHidden()
        }
    }

    #Preview {
        ContentView()
}
