//
//  AddressSelectMapView.swift
//  OurDoorApp
//
//  Created by Nikola Grdanoski on 19.4.25.
//

import SwiftUI
import MapKit

struct AddressSelectMapView: View {
    @State public var place = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2DMake(41.996, 21.431), span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
        )
    )
    
    
    var body: some View {
        //Text("Hello, World!")
        
        Map(position: $place, interactionModes: [.rotate, .zoom, .pan])
            .onMapCameraChange {
                context in print(context.region)
            }
    }
}

#Preview {
    AddressSelectMapView()
}
