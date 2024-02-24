//
//  EntryView.swift
//  Pocky
//
//  Created by Rose Choi on 2/22/24.
//

import SwiftUI

struct FlashCard: View {
    @ObservedObject var viewModel: FlashCardViewModel = FlashCardViewModel(id: UUID(), question: "This is the question", answer: "This is the answer")
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    var content: some View {
        RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(viewModel.isFlipped ? .white : .blue)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(.blue, lineWidth: 1.0)
             )
            .overlay(alignment: .center, content: {
                Text(viewModel.isFlipped ? viewModel.answer : viewModel.question)
            })
            .padding()
            .rotation3DEffect(.degrees(viewModel.contentRotation), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(viewModel.flashCardRotation), axis: (x: 0, y: 1, z: 0))
            .onTapGesture {
                viewModel.flipFlashCard()
            }
    }
}

#Preview {
    FlashCard()
}
