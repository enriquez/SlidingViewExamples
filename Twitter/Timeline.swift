//
//  Timeline.swift
//  Twitter
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct Timeline: View {
    @EnvironmentObject var draggableAnimation: DraggableAnimation

    var body: some View {
        NavigationView {
            List {
                ForEach(1...30, id: \.self) { n in
                    Text("Look at my awesome post \(n)")
                }
            }
                .navigationTitle("🐦")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Button(action: {
                                draggableAnimation.anchor()
                            }) {
                                Image(systemName: "list.bullet")
                            }
                        }
                    }
                }
        }
        .foregroundColor(.black)
        .accentColor(.blue)
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline()
    }
}
