//
//  JangbuRichApp.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

@main
struct JangbuRichApp: App {
    
    @ObservedObject private var navigationPathManager = NavigationPathManager()
    @StateObject private var overlayManager = OverlayManager()
    
    init() {
        KakaoSDK.initSDK(appKey: "YOUR_NATIVE_APP_KEY")
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(navigationPathManager)
                .environmentObject(overlayManager)
                .overlay(OverlayContainer().environmentObject(overlayManager))
                .onOpenURL { url in
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
