//
//  DressCodeApp.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 04/11/24.
//

import SwiftUI

@main
struct DressCodeApp: App {
    @StateObject private var wardrobeManager = WardrobeManager()

        var body: some Scene {
            WindowGroup {
                ContainerView()
                    .environmentObject(wardrobeManager)
            }
        }
    }
