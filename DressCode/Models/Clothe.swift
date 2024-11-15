//
//  Clothe.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 13/11/24.
//

import Foundation
import SwiftData

@Model // to define it is a swiftData model
class Clothe: Identifiable {
    var id = UUID()
    var color: String
    var clotheType: String
    var clotheDescription: String?
    
    init(color: String, clotheType: String, clotheDescription: String? = nil) {
        self.color = color
        self.clotheType = clotheType
        self.clotheDescription = clotheDescription
    }
}