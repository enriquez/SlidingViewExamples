//
//  Camera.swift
//  LockScreen
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI
import SlidingView

struct Camera: View {
    @EnvironmentObject var animations: ObservableDictionary<AnimationKey, DraggableAnimation>

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "bolt.slash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "sun.min")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "timer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "wand.and.rays")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    Spacer(minLength: 40)
                }
                    .frame(maxWidth: .infinity, maxHeight: 75)
                    .padding(20)
                ZStack {
                    Color.green.edgesIgnoringSafeArea(.all)
                }
                VStack {
                    HStack {
                        Text("SLO-MO")
                        Text("VIDEO")
                        Text("PHOTO")
                        Text("PORTRAIT")
                    }
                    HStack {
                        Rectangle()
                            .frame(width: 60, height: 60)
                        Spacer()
                        Circle()
                            .frame(width: 100, height: 100)
                            .onTapGesture {
                                self.animations.dictionary[.camera]!.reset()
                            }
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "camera")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                            .frame(width: 40, height: 40)
                    }
                        .padding(20)
                }
            }
        }
            .accentColor(.white)
            .foregroundColor(.white)
    }
}


struct Camera_Previews: PreviewProvider {
    static var previews: some View {
        Camera()
    }
}
