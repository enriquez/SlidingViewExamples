//
//  ContentView.swift
//  LockScreen
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct ContentView: View {
    var body: some View {
        SlidingView { widgetAnimation, cameraAnimation, containerWidth in
            let widgetGesture = widgetAnimation.dragGesture(positiveDirection: .leadingToTrailing)
            let cameraGesture = cameraAnimation.dragGesture(positiveDirection: .trailingToLeading)
            let comboGesture = widgetGesture.simultaneously(with: cameraGesture)
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                Camera()
                    .scaleEffect(0.9 + (cameraAnimation.percentage * 0.1))
                    .modifier(DelayedOpacity(percentage: cameraAnimation.percentage)) // a non-linear animation
                    .removeWhenInactive(percentage: cameraAnimation.percentage)
                    .onAppear {
                        print("hello im the camera")
                    }
                    .onDisappear {
                        print("bye")
                    }
                    .gesture(cameraGesture)
                LockScreen()
                    .offset(x: -containerWidth * cameraAnimation.percentage)
                    .blur(radius: 10 * widgetAnimation.percentage)
                    .gesture(comboGesture)
                    .allowsHitTesting(cameraAnimation.percentage == 0 && widgetAnimation.percentage == 0)
                Widgets()
                    .frame(width: containerWidth - 50)
                    .offset(x: -containerWidth + (containerWidth * widgetAnimation.percentage))
                    .gesture(widgetGesture)
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
            content(dictionary[.widgets]!, dictionary[.camera]!, geometry.size.width)
        }
    }
}

struct DelayedOpacity: AnimatableModifier {
    var percentage: CGFloat

    var animatableData: CGFloat {
        get { percentage > 0.5 ? (percentage - 0.5) * 2 : 0 }
        set { percentage = newValue }
    }

    func body(content: Content) -> some View {
        content.opacity(Double(self.animatableData))
    }
}
