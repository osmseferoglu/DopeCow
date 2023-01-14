//
//  ContentView.swift
//  DopeCow
//
//  Created by Osman Seferoğlu on 9.01.2023.
//

import SwiftUI
import Foundation


func cleanSpringboardHome(dope:Bool,noHomeBar:Bool,noDock:Bool,noBanner:Bool){
    if(dope) {dopifySettings()}
    if(noHomeBar){removeHomeBar()}
    if(noDock){removeDockBg()}
    if(noBanner){removeShortcutBanner()}
}


private let lockMenuItems = ContextMenu{
    
    Button {
        customLockSound(Name: "beep")
        sleep(1)
        customLockSound(Name: "beep")
    } label: {
        Label("Beep", systemImage: "")
    }
    
}



private let chargeMenuItems = ContextMenu {
    
    Button {
        customChargeSound(Name: "AWbolt")
        sleep(1)
        customChargeSound(Name: "AWbolt")
    } label: {
        Label("AW Charge", systemImage: "")
        
    }
    Button {
        customChargeSound(Name: "beep")
        sleep(1)
        customChargeSound(Name: "beep")
    } label: {
        Label("Beep", systemImage: "")
    }
    
    Button {
        customChargeSound(Name: "Boom_Headshot")
        sleep(1)
        customChargeSound(Name: "Boom_Headshot")
    } label: {
        Label("Boom Headshot", systemImage: "")
    }
    
    Button {
        customChargeSound(Name: "du-duuuu")
        sleep(1)
        customChargeSound(Name: "du-duuuu")
    } label: {
        Label("Du-duuuu", systemImage: "")
    }
    
    Button {
        customChargeSound(Name: "he_he")
        sleep(1)
        customChargeSound(Name: "he_he")
    } label: {
        Label("HeHe", systemImage: "")
    }
    
    Button {
        customChargeSound(Name: "ios6")
        sleep(1)
        customChargeSound(Name: "ios6")
    } label: {
        Label("iOS 6", systemImage: "")
    }
    
    Button {
        customChargeSound(Name: "Mario_Jump")
        sleep(1)
        customChargeSound(Name: "Mario_Jump")
    } label: {
        Label("Mario Jump", systemImage: "")
    }
    
    Button {
        customChargeSound(Name: "ribbit")
        sleep(1)
        customChargeSound(Name: "ribbit")
    } label: {
        Label("Ribbit", systemImage: "")
    }
    
    Button {
        customChargeSound(Name: "wow")
        sleep(1)
        customChargeSound(Name: "wow")
    } label: {
        Label("Wow", systemImage: "")
    }
    
}

struct ContentView: View {
    
    @AppStorage("TH_dope") private var dopifySettings = false;
    @AppStorage("TH_homebar") private var removeHomeBar = false;
    @AppStorage("TH_noDock") private var removeDockBg = false;
    @AppStorage("TH_noBanner") private var removeShortcutBanner = false;
    @AppStorage("TH_customChargeSound") private var customChargeSound = false;
    @State private var showingAlert = false;
    @State private var shouldShowMenu = true
    
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
                        .multilineTextAlignment(.center)
                    
                    HStack{
                        Image(systemName: "gear")
                        Toggle(isOn: $dopifySettings){
                            Text("Dope Settings")
                            Text("No need to Respring")
                            Text("Apply and Close Settings app")
                        }}
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
                        Image(systemName: "platter.filled.top.and.arrow.up.iphone")
                        Toggle(isOn:$removeShortcutBanner){
                            Text("Remove Shortcut Banners")
                        }
                    }
                    HStack {
                        Image(systemName: "bolt.fill")
                        Text("Charge Sound")
                        Text("Select Tone")
                            .foregroundColor(.accentColor)
                            .contextMenu(shouldShowMenu ? chargeMenuItems : nil)
                    }
                    
                    
                    HStack {
                        Image(systemName: "lock.fill")
                        Text("Lock Sound")
                        Text("Select Tone")
                            .foregroundColor(.accentColor)
                            .contextMenu(shouldShowMenu ? lockMenuItems : nil)
                    }
                    
                    
                    
                }
            }
        
       
            HStack{
                Button("Apply", action: {
                    showingAlert = true
                    cleanSpringboardHome(dope:dopifySettings,noHomeBar: removeHomeBar,noDock: removeDockBg,noBanner: removeShortcutBanner)})
                
                .alert("Applied, Reboot your device if it didn't work.", isPresented: $showingAlert) {
                    Button("Dismiss") {cleanSpringboardHome(dope:dopifySettings,noHomeBar: removeHomeBar,noDock: removeDockBg,noBanner: removeShortcutBanner)}}
                .controlSize(.large)
                .tint(.blue)
                .controlSize(.large)
                .buttonStyle(.bordered);
                
                Button("Respring",action: {
                    sleep(2)
                    showingAlert = true
                    print("Respringing...")
                    guard let window = UIApplication.shared.windows.first else { return }
                    while true {
                        window.snapshotView(afterScreenUpdates: false)
                    }})}
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.red);
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
