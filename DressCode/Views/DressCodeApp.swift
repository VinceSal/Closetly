//
//  DressCodeApp.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 04/11/24.
//

import SwiftData // to use swiftData
import SwiftUI

@main
struct DressCodeApp: App {
    var body: some Scene {
        WindowGroup {
            ContainerView()
        }
        .modelContainer(for: Clothe.self) // Initialize the swiftData container for this model
    }
}
