//
//  Tabs.swift
//  Instagram
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            Timeline()
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass") }
            Text("Reels")
                .tabItem { Image(systemName: "play.rectangle") }
            Text("Shop")
                .tabItem { Image(systemName: "bag") }
            Text("Profile")
                .tabItem { Image(systemName: "person.crop.circle") }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
