//
//  Item.swift
//  Stockly
//
//  Created by Timo Bruns on 07.10.26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
