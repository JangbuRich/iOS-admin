//
//  NavigationPathManager.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

class NavigationPathManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func resetToRoot() {
        path = NavigationPath()
    }
}
