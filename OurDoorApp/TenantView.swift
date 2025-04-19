//
//  TenantView.swift
//  OurDoorApp
//
//  Created by Nikola Grdanoski on 13.4.25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

struct TenantView: View {
    @State private var isPresenting = false
    @State var entrances = [Dictionary <String, AnyObject>()]
    
    func fetchData() {
        print("Yeah")
        Database.database()
            .reference()
            .child("entrances")
            .observe(DataEventType.childAdded) {
                (snapshot) in
                if let entrance = snapshot.value as? [String: AnyObject] {
                    self.entrances.append(entrance)
                    print("Data")
                }
            }
    }
    
    var body: some View {
        //Text("Hello, World!")
        
        NavigationStack {
            HStack {
                NavigationLink(destination: ContentView(), isActive: self.$isPresenting, label: {
                    Button ("Sign Out") {
                        try? Auth.auth().signOut()
                        isPresenting = true
                    }
                })
                .navigationBarBackButtonHidden()
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.bordered)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 7))
                .padding()
                
                Spacer()
                
                NavigationLink("New Entrance", destination: NewEntranceView())
                    .buttonStyle(.bordered)
                    .background(.green)
                    .foregroundStyle(.white)
                    .buttonBorderShape(.roundedRectangle)
                    .clipShape(.rect(cornerRadius: 7))
                    .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    TenantView()
}
