//
//  Card.swift
//  Pocky
//
//  Created by Rose Choi on 2/22/24.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var question: String
    var answer: String
}
