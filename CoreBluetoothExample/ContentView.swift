//
//  ContentView.swift
//  CoreBluetoothExample
//
//  Created by Mourad KIRAT  on 23/02/2024.
//

import SwiftUI


struct ContentView: View {
    @StateObject var bluetoothManager = BluetoothManager()
    @State private var color:String = "242424"
    @State private var statebluetooth:Bool = false
    var body: some View {
        VStack {
            HStack {
                Image("image_title")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250.0, height:75.0,alignment: .leading)
              
            }.background(Color.init(UIColor(hexString: self.color)))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(10)
            // Form 1
Form {
    //section 1
     Section(header:Text("State bluetooth")
            .foregroundColor(Color.white)
             
            .font(.system(size: 20, weight: .bold))){
                Toggle(isOn: $statebluetooth) {
                    Text(bluetoothManager.isBluetoothEnabled ? "Turn Off Bluetooth" : "Turn On Bluetooth")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color.init(UIColor(hexString: "#000000")))
                    }.tint(Color.init(UIColor(hexString: "#00BFFF"))) // End
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .onChange(of:statebluetooth) { value in
                         bluetoothManager.toggleBluetooth()
                        // self.statebluetooth = bluetoothManager.isBluetoothEnabled
                                            }
                            
     } .listRowBackground(Color.white)
    // Section 2
    if  self.statebluetooth  == true {
                    List(bluetoothManager.discoveredPeripherals, id: \.identifier) { peripheral in
                        Text(peripheral.name ?? "Unknown")
                    }
//    Section(header:Text("List peripheral names")
//           .foregroundColor(Color.white)
//           .font(.headline)){
//               Text( "iPhone 13")
//                   .font(.system(size: 17, weight: .medium))
//               .foregroundColor(Color.init(UIColor(hexString: "#000000")))
//               Text( "iPhone MKirat")
//                   .font(.system(size: 17, weight: .medium))
//               .foregroundColor(Color.init(UIColor(hexString: "#000000")))
//                           
//    } .listRowBackground(Color.white)
    }
                }.tint( Color.white)
                    .background(Color.init(UIColor(hexString: self.color)))
                    .scrollContentBackground(.hidden)
                    .padding(10)
            // End Form 1
            
            
            
        } // Vstack
        .background(Color.init(UIColor(hexString: self.color)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




