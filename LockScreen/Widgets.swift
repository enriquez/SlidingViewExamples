//
//  Widgets.swift
//  LockScreen
//
//  Created by Mike Enriquez on 3/25/21.
//

import SwiftUI

struct Widgets: View {
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        UITableView.appearance().tableFooterView = UIView()
    }

    var body: some View {
        let list = List {
            ForEach(0..<1, id: \.self) { _ in
                Section() {
                    ListRow {
                        VStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 50)
                                .cornerRadius(20)
                            Rectangle()
                                .fill(Color.green)
                                .frame(height: 120)
                                .cornerRadius(20)
                            HStack {
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(height: 120)
                                    .cornerRadius(20)
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(height: 120)
                                    .cornerRadius(20)
                            }
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 500)
                                .cornerRadius(20)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .background(Color.clear)
            }
        }
        return list
    }
}

struct ListRow<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        self.content
            .listRowBackground(Color.clear)
    }
}

struct Widgets_Previews: PreviewProvider {
    static var previews: some View {
        Widgets()
    }
}
