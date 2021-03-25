//
//  ContentView.swift
//  Twitter
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct ContentView: View {
    let leadingOffset: CGFloat = 50
    let primaryLeadingAnchoredOpacity: CGFloat = 0.5

    var body: some View {
        SlidingView { draggableAnimation, geometry in
            ZStack {
                let containerWidth = geometry.size.width
                Menu()
                    .offset(x: -containerWidth + min(max(0, draggableAnimation.percentage), (1 - (leadingOffset / containerWidth))) * containerWidth)
                    .opacity(Double(draggableAnimation.percentage))
                    .removeWhenInactive(percentage: draggableAnimation.percentage)
                ZStack {
                    Color.gray.edgesIgnoringSafeArea(.all)
                    Tabs()
                        .disabled(draggableAnimation.percentage > 0)
                        .opacity(Double(1 - draggableAnimation.percentage * primaryLeadingAnchoredOpacity))
                }
                .offset(x: min(max(0, draggableAnimation.percentage), (1 - (leadingOffset / containerWidth))) * containerWidth)
                .gesture(draggableAnimation.percentage == 1 ? TapGesture().onEnded { draggableAnimation.reset() } : nil)
            }
            .gesture(draggableAnimation.dragGesture(positiveDirection: .leadingToTrailing))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
