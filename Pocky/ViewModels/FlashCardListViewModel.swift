//
//  FlashCardListViewModel.swift
//  Pocky
//
//  Created by Rose Choi on 2/26/24.
//

import Foundation

class FlashCardListViewModel: ObservableObject {
    var flashCardViewModels: [FlashCardViewModel]
    let spacing: CGFloat = 10
    
    @Published var offset: CGFloat = 0
    @Published var index = 0
    
    init(flashCardViewModels: [FlashCardViewModel]) {
        self.flashCardViewModels = flashCardViewModels
    }
}
