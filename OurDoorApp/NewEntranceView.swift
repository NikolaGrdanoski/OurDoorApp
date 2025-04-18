//
//  NewEntranceView.swift
//  OurDoorApp
//
//  Created by Nikola Grdanoski on 16.4.25.
//

import SwiftUI

struct NewEntranceView: View {
    @State private var isPresented = false
    @State var entranceName: String = ""
    var body: some View {
        //Text("Hello, World!")
        
        NavigationStack {
            Text("New Entrance")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Spacer()
            
            TextField("Name", text: $entranceName)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.purple)
            .textFieldStyle(.roundedBorder)
            .padding()
            
            NavigationLink(destination: TenantView(), label: {
                Button("Select address") {}
            })
            .foregroundStyle(.white)
            .background(.purple)
            .buttonBorderShape(.roundedRectangle)
            .buttonStyle(.bordered)
            .clipShape(.rect(cornerRadius: 9))
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    NewEntranceView()
}
