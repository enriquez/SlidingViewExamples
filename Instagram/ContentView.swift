//
//  ContentView.swift
//  Instagram
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct ContentView: View {
    let shareStartingOffset: CGFloat = -100
    let shareEndingOffset: CGFloat = 0

    var body: some View {
        SlidingView { shareAnimation, messagesAnimation, containerWidth in
            let shareGesture = shareAnimation.dragGesture(positiveDirection: .leadingToTrailing)
            let messagesGeseture = messagesAnimation.dragGesture(positiveDirection: .trailingToLeading)
            let combinedGesture = shareGesture.simultaneously(with: messagesGeseture)
            ZStack {
                Share()
                    .offset(x: shareStartingOffset + (shareAnimation.percentage * (shareEndingOffset - shareStartingOffset)))
                    .opacity(Double(shareAnimation.percentage))
                    .gesture(shareGesture)
                    .removeWhenInactive(percentage: shareAnimation.percentage)
                Tabs()
                    .offset(x: shareAnimation.percentage * containerWidth)
                    .offset(x: messagesAnimation.percentage * -containerWidth)
                    .gesture(combinedGesture)
                Messages()
                    .offset(x: containerWidth + (messagesAnimation.percentage * -containerWidth))
                    .gesture(messagesGeseture)
                    .removeWhenInactive(percentage: messagesAnimation.percentage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension SlidingView where Key == AnimationKey {
    init(@ViewBuilder content: @escaping (DraggableAnimation, DraggableAnimation, CGFloat) -> Content) {
        self.init(keys: AnimationKey.allCases) { dictionary, geometry in
            content(dictionary[.share]!, dictionary[.messages]!, geometry.size.width)
        }
    }
}
