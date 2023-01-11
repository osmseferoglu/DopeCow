//
//  ContentView.swift
//  DopeCow
//
//  Created by Osman Seferoğlu on 9.01.2023.
//

import SwiftUI
import Foundation

func cleanSpringboardHome(dope:Bool,noHomeBar:Bool,noDock:Bool,noRestrictions:Bool,noBanner:Bool,chargeSound:Bool,lockSound:Bool){
    if(dope) {dopifySettings()}
    if(noHomeBar){removeHomeBar()}
    if(noDock){removeDockBg()}
    if(noRestrictions){removeRestrictions()}
    if(noBanner){removeShortcutBanner()}
    if(chargeSound){customChargeSound()}
    if(lockSound){customLockSound()}
}

struct ContentView: View {
    
    @State private var showInfo = false;
    
    @AppStorage("TH_dope") private var dopifySettings = false;
    @AppStorage("TH_homebar") private var removeHomeBar = false;
    @AppStorage("TH_noDock") private var removeDockBg = false;
    @AppStorage("TH_noRestrictions") private var removeRestrictions = false;
    @AppStorage("TH_noBanner") private var removeShortcutBanner = false;
    @AppStorage("TH_customChargeSound") private var customChargeSound = false;
    @AppStorage("TH_customLockSound") private var customLockSound = false;
   
    var body: some View {
        VStack {
            Text("🐮")
            
            Image("stfu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5.0)
                .padding()
                .onTapGesture {
                    if let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                }
            Text("Don't tap on this image ⬆️")
            List{
                Button("🐦 @Osmannseferoglu") {
                    if let url = URL(string: "https://twitter.com/Osmannseferoglu") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                }.accentColor(.blue)
                
                HStack{
                    Image(systemName: "gear")
                    Toggle(isOn: $dopifySettings){
                        Text("Dope Settings")
                        Text("No need to Respring")
                        Text("Apply and Close Settings app")
                    }}
               
                HStack{
                    Text("SpringBoard Tweaks")
                    Image(systemName: "apps.iphone")
                }
                HStack{
                    Text("Needs Respring")
                    Image(systemName: "arrow.triangle.2.circlepath")
                }.foregroundColor(.red)
                HStack{
                    Image(systemName: "iphone.gen2")
                    Toggle(isOn: $removeHomeBar){
                        Text("Remove HomeBar from Apps")
                    }}
                HStack{
                    Image(systemName: "platter.filled.bottom.iphone")
                    Toggle(isOn: $removeDockBg){
                        Text("Remove Dock Background")
                    }
                }
                HStack{
                    Image(systemName: "globe")
                    Toggle(isOn: $removeRestrictions){
                        Text("Remove Country Based Restrictions")
                    }}
                HStack{
                    Image(systemName: "platter.filled.top.and.arrow.up.iphone")
                    Toggle(isOn:$removeShortcutBanner){
                        Text("Remove Shortcut Banners")
                    }}
                HStack {
                    Image(systemName: "bolt.fill")
                    Toggle(isOn: $customChargeSound){
                        Text("Charge Sound")
                        Text("BatteryMagsafe_Haptic")
                        
                    }
            }
                HStack {
                    Image(systemName: "lock.fill")
                    Toggle(isOn: $customLockSound){
                        Text("Lock Sound")
                        Text("AppleWatchUnlock")
                    }
            }
                
                
            }
            HStack{
                Button("Apply", action: {
                    cleanSpringboardHome(dope:dopifySettings,noHomeBar: removeHomeBar,noDock: removeDockBg,noRestrictions: removeRestrictions,noBanner: removeShortcutBanner,chargeSound: customChargeSound,lockSound:customLockSound)})
                .controlSize(.large)
                .tint(.blue)
                .buttonStyle(.bordered)
                Button("Respring",action: {
                    print("Respringing...")
                    guard let window = UIApplication.shared.windows.first else { return }
while true {
   window.snapshotView(afterScreenUpdates: false)
}
                })
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.red);
            }}
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
