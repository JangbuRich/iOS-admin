//
//  JangbuRichApp.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

@main
struct JangbuRichApp: App {
    
    @ObservedObject private var navigationPathManager = NavigationPathManager()
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(navigationPathManager)
        }
    }
}
