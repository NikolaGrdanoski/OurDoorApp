//
//  TenantView.swift
//  OurDoorApp
//
//  Created by Nikola Grdanoski on 13.4.25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct TenantView: View {
    @State private var isPresenting = false
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        NavigationStack {
            HStack {
                NavigationLink(destination: ContentView(), isActive: self.$isPresenting, label: {
                    Button ("Sign Out") {
                        try? Auth.auth().signOut()
                        isPresenting = true
                    }
                })
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    TenantView()
}
