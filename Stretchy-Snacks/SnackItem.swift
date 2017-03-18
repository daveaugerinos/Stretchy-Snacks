//
//  SnackItem.swift
//  Stretchy-Snacks
//
//  Created by Dave Augerinos on 2017-03-17.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import Foundation

struct SnackItem {
    
    let snack: Snack
    
    enum Snack: String {
        
        case oreos = "Oreos"
        case pizzaPockets = "Pizza Pockets"
        case popTarts = "Pop Tarts"
        case popscile = "Popscile"
        case ramen = "Ramen"
    }
    
    init(snack: Snack) {
        
        self.snack = snack
    }
}
