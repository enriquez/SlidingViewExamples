//
//  Share.swift
//  Instagram
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct Share: View {
    @EnvironmentObject var animations: ObservableDictionary<AnimationKey, DraggableAnimation>

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                Text("Share on Instagram")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        animations.dictionary[.share]?.reset()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
        .foregroundColor(.white)
        .accentColor(.white)
    }
}

struct Share_Previews: PreviewProvider {
    static var previews: some View {
        Share()
    }
}
