//
//  MenuButton.swift
//  Twitter
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI

struct MenuButton: View {
    let name: String
    let imageSystemName: String?

    init(name: String, imageSystemName: String?) {
        self.name = name
        self.imageSystemName = imageSystemName
    }

    init(name: String) {
        self.init(name: name, imageSystemName: nil)
    }

    var body: some View {
        HStack {
            if let systemName = self.imageSystemName {
                Image(systemName: systemName)
            }
            Text(name)
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(name: "hello", imageSystemName: "hand.raised")
    }
}
