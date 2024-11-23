//
//  JangbuRichApp.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

@main
struct JangbuRichApp: App {
    
    @ObservedObject var authStore = AuthStore()
    @ObservedObject var todayOrderStore = TodayOrderStore()
    @ObservedObject var jangbuStore = JangbuStore()
    @ObservedObject var myInfoStore = MyInfoStore()
    
    @StateObject private var overlayManager = OverlayManager()
    
    init() {
        KakaoSDK.initSDK(appKey: Config.nativeAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(authStore)
                .environmentObject(todayOrderStore)
                .environmentObject(jangbuStore)
                .environmentObject(myInfoStore)
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
