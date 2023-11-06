//
//  ContentView.swift
//  mapKitProject
//
//  Created by Kaua Miguel on 01/11/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    let centralPark = CLLocationCoordinate2D(latitude: 40.78256018271651, longitude: -73.96558073141934)
    
    let historyMuseum = CLLocationCoordinate2D(latitude: 40.781392202320774, longitude:  -73.97413045277663)
    
    @State var cameraPosition : MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $cameraPosition) {
            
            Marker("Central Parl",systemImage: "building.fill" ,coordinate: centralPark)
                .tint(.blue)
            
            
            Marker("Histoyr Museum", coordinate: historyMuseum)
        }
        //Change the map style
        .mapStyle(.imagery)
        
        //Change the camera position when press the button
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button(action: {
                    cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: historyMuseum, latitudinalMeters: 600, longitudinalMeters: 600))
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
