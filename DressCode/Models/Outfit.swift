//
//  Outfit.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 18/11/24.
//

import Foundation
import SwiftData

@Model
class Outfit: Identifiable {
    var id = UUID()
    var name: String
    var imageJacket: Data
    var imageShirt: Data
    var imageSweatshirt: Data
    var imagePant: Data
    var imageShoe: Data
    var isFavorite: Bool?
    var assignedDate: Date?
    
    init(name: String, imageJacket: Data, imageShirt: Data, imageSweatshirt: Data, imagePant: Data, imageShoe: Data, isFavorite: Bool? = nil, assignedDate: Date? = nil) {
        self.name = name
        self.imageJacket = imageJacket
        self.imageShirt = imageShirt
        self.imageSweatshirt = imageSweatshirt
        self.imagePant = imagePant
        self.imageShoe = imageShoe
        self.isFavorite = isFavorite
        self.assignedDate = assignedDate
    }
}
