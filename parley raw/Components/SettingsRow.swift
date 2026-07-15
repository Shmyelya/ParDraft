//
//  SettingsRow.swift
//  parley raw
//
//  Created by Адлет Жумагалиев on 15.07.2026.
//

import SwiftUI

struct SettingsRow<Destination: View>: View {
    let title: String
    let trailingText: String?
    let destination: Destination

    var body: some View {
        NavigationLink {
            destination
        } label: {
            HStack {
                Text(title)
                    .foregroundStyle(.primary)

                Spacer()

                if let trailingText {
                    Text(trailingText)
                        .foregroundStyle(.gray)
                }

                Image(systemName: "chevron.right")
                    .foregroundStyle(.primary)
            }
            .padding(.vertical, 16)
        }
    }
}
