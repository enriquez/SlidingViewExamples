//
//  Tabs.swift
//  Twitter
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            Timeline()
                .tabItem { Image(systemName: "house") }
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass") }
            Text("Notifications")
                .tabItem { Image(systemName: "bell") }
            Text("Direct Messages")
                .tabItem { Image(systemName: "envelope") }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
