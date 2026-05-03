//
//  ContentView.swift
//  LittleLemon
//
//  Created by Serge Sinkevych on 5/3/26.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted = false

    var body: some View {
        if isOnboardingCompleted {
            HomeView()
        } else {
            OnboardingView()
        }
    }
}
