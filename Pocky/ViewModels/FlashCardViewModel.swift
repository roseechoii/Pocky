//
//  FlashCardViewModel.swift
//  Pocky
//
//  Created by Rose Choi on 2/22/24.
//

import SwiftUI

class FlashCardViewModel: ObservableObject, Identifiable {
    @Published var contentRotation: Double = 0.0
    @Published var flashCardRotation: Double = 0.0
    @Published var isFlipped: Bool
    
    var id: UUID
    var question: String
    var answer: String
    var timeDivisor: Double = 2.0
    var animationTime = 0.5
    var contentAnimationTime = 0.001
    
    init(isFlipped: Bool = false, 
         id: UUID, 
         question: String,
         answer: String) {
        self.isFlipped = isFlipped
        self.id = id
        self.question = question
        self.answer = answer
    }
    
    func flipFlashCard() {
        withAnimation(Animation.linear(duration: animationTime)) {
            flashCardRotation += 180
        }
        
        withAnimation(Animation.linear(duration: contentAnimationTime).delay(animationTime/timeDivisor)) {
            contentRotation += 180
            isFlipped.toggle()
        }
    }
}
