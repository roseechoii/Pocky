//
//  FlashCardListView.swift
//  Pocky
//
//  Created by Rose Choi on 2/26/24.
//

import SwiftUI

struct FlashCardListView: View {
    @ObservedObject var viewModel: FlashCardListViewModel = FlashCardListViewModel(flashCardViewModels: [
        FlashCardViewModel(id: UUID(), question: "Question 1", answer: "Answer 1"),
        FlashCardViewModel(id: UUID(), question: "Question 2", answer: "Answer 2"),
        FlashCardViewModel(id: UUID(), question: "Question 3", answer: "Answer 3"),
        FlashCardViewModel(id: UUID(), question: "Question 4", answer: "Answer 4"),
        FlashCardViewModel(id: UUID(), question: "Question 5", answer: "Answer 5")
    ])
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: viewModel.spacing) {
                    ForEach(viewModel.flashCardViewModels) { viewModel in
                        FlashCard(viewModel: viewModel)
                            .frame(width: geometry.size.width)
                    }
                }
            }
            .content.offset(x: viewModel.offset)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        viewModel.offset = value.translation.width - geometry.size.width * CGFloat(viewModel.index)
                    })
                    .onEnded({ value in
                        if -value.predictedEndTranslation.width > geometry.size.width / 2, viewModel.index < viewModel.flashCardViewModels.count - 1 {
                            viewModel.index += 1
                        }
                        if value.predictedEndTranslation.width > geometry.size.width / 2, viewModel.index > 0 {
                            viewModel.index -= 1
                        }
                        withAnimation { viewModel.offset = -(geometry.size.width + viewModel.spacing) * CGFloat(viewModel.index) }
                    })
            )
        }
    }
}

#Preview {
    FlashCardListView()
}
