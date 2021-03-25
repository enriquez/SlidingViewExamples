//
//  Timeline.swift
//  Instagram
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct Timeline: View {
    @EnvironmentObject var animations: ObservableDictionary<AnimationKey, DraggableAnimation>

    var body: some View {
        NavigationView {
            List {
                ForEach(1...30, id: \.self) { n in
                    Text("Look at my awesome post \(n)")
                }
            }
                .navigationTitle("Instagram")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: {
                                DispatchQueue.main.async {
                                    animations.dictionary[.share]?.anchor()
                                }
                            }) {
                                Image(systemName: "plus.square")
                            }
                            Button(action: {
                                DispatchQueue.main.async {
                                    animations.dictionary[.messages]?.anchor()
                                }
                            }) {
                                Image(systemName: "bubble.left")
                            }
                        }
                    }
                }
        }
        .foregroundColor(.black)
        .accentColor(.black)
        .tabItem { Image(systemName: "house") }
    }
}


struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline()
    }
}
