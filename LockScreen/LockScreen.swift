//
//  LockScreen.swift
//  LockScreen
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct LockScreen: View {
    @EnvironmentObject var animations: ObservableDictionary<AnimationKey, DraggableAnimation>

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Image("desert")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    Button(action: {
                        self.animations.dictionary[.widgets]!.anchor()
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                        .frame(width: 60, height: 60)
                        .padding(40)
                    Spacer()
                    Button(action: {
                        self.animations.dictionary[.camera]!.anchor()
                    }, label: {
                        Image(systemName: "camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                        .frame(width: 60, height: 60)
                        .padding(40)
                }
            }
        }
        .accentColor(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LockScreen_Previews: PreviewProvider {
    static var previews: some View {
        LockScreen()
    }
}
