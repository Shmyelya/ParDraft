//
//  SettingsView.swift
//  parley raw
//
//  Created by Адлет Жумагалиев on 15.07.2026.
//

import SwiftUI

struct SettingsView: View {
    @State private var primaryUse: PrimaryUse = .work
    @State private var bioText: String = ""
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                // MARK: - Profile pic + email
                Image("pfp")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Text(verbatim: "example@gmail.com")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Section {
                    Picker("Primary use", selection: $primaryUse) {
                        ForEach(PrimaryUse.allCases) { primaryUse in
                            Text(primaryUse.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextEditor(text: $bioText)
                        .scrollContentBackground(.hidden)
                        .background(.ultraThinMaterial)
                        .frame(height: 200)
//                        .padding()
//                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .disableAutocorrection(true)
                }
                
                SettingsRow(
                    title: "Personal information",
                    trailingText: "Change",
                    destination: EditProfileView()
                )
                
                SettingsRow(
                    title: "Change Password",
                    trailingText: nil,
                    destination: EditProfileView()
                )
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Log Out")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                }
                
            }
            .padding(.horizontal)
        }
    }
}

enum PrimaryUse: String, CaseIterable, Identifiable {
    case work, learning, sport, social
    var id: Self { self }
}

#Preview {
    SettingsView()
}
