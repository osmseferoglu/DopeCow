//
//  ContentView.swift
//  DopeCow
//
//  Created by Osman Seferoğlu on 9.01.2023.
//

import SwiftUI

func cleanSpringboardHome(dope:Bool){
    if(dope) {dopifySettings()}
}
struct ContentView: View {
    @State private var showInfo = false;
    
    @AppStorage("TH_dope") private var dopifySettings = false;
    var body: some View {
        VStack {
            Image("stfu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5.0)
                .padding()
            List{
                
                Toggle(isOn: $dopifySettings){
                    Text("Dope Settings")
                    Text("No need to Respring")
                    Text("Apply and Close Settings app")
                }
                Button("Follow me on Twitter") {
                    if let url = URL(string: "https://twitter.com/Osmannseferoglu") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                }.accentColor(.blue)
            }
        
            Button("Apply", action: {
                cleanSpringboardHome(dope:dopifySettings)})
                .controlSize(.large)
                .tint(.blue)
                .buttonStyle(.bordered)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
