//
//  Messages.swift
//  Instagram
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct Messages: View {
    @EnvironmentObject var animations: ObservableDictionary<AnimationKey, DraggableAnimation>

    var body: some View {
        NavigationView {
            Color.white
                .navigationTitle("Messages")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            animations.dictionary[.messages]?.reset()
                        }) {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
        }
        .foregroundColor(.black)
        .accentColor(.black)
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}
