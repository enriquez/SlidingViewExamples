//
//  Menu.swift
//  Twitter
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Mike Enriquez")
                Text("@enriquez")
                ScrollView {
                    VStack(alignment: .leading) {
                        MenuButton(name: "Profile", imageSystemName: "person")
                        MenuButton(name: "Lists", imageSystemName: "doc.plaintext")
                        MenuButton(name: "Topics", imageSystemName: "text.bubble")
                        MenuButton(name: "Bookmarks", imageSystemName: "bookmark")
                        MenuButton(name: "Moments", imageSystemName: "bolt")
                        Divider()
                        MenuButton(name: "Twitter Ads", imageSystemName: "arrow.up.right.square")
                        Divider()
                        MenuButton(name: "Settings and privacy")
                        MenuButton(name: "Help Center")
                    }
                }
            }
            .padding(.leading, 70)
            .padding(.trailing, 20)
            .padding(.top, 20)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
