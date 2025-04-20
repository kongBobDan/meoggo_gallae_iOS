//
//  ButtonTestView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/19/25.
//

import SwiftUI

struct ButtonGroup<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)

            HStack(spacing: 16) {
                content()
            }
        }
        .padding(.horizontal)
    }
}

struct ButtonTestView: View {
    let title = "Text"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ButtonGroup(title: "Dark / Enabled") {
                    MGButton(title: title, type: .enabled, size: .medium, color: .dark) { print("Tapped") }
                    MGButton(title: title, type: .enabled, size: .small, color: .dark) { print("Tapped") }
                }

                ButtonGroup(title: "Dark / Focused") {
                    MGButton(title: title, type: .focused, size: .medium, color: .dark) { print("Tapped") }
                    MGButton(title: title, type: .focused, size: .small, color: .dark) { print("Tapped") }
                }

                ButtonGroup(title: "Light / Enabled") {
                    MGButton(title: title, type: .enabled, size: .medium, color: .light) { print("Tapped") }
                    MGButton(title: title, type: .enabled, size: .small, color: .light) { print("Tapped") }
                }

                ButtonGroup(title: "Light / Focused") {
                    MGButton(title: title, type: .focused, size: .medium, color: .light) { print("Tapped") }
                    MGButton(title: title, type: .focused, size: .small, color: .light) { print("Tapped") }
                }

                ButtonGroup(title: "Fill / Enabled") {
                    MGButton(title: title, type: .enabled, size: .medium, color: .fill) { print("Tapped") }
                    MGButton(title: title, type: .enabled, size: .small, color: .fill) { print("Tapped") }
                }

                ButtonGroup(title: "Fill / Focused") {
                    MGButton(title: title, type: .focused, size: .medium, color: .fill) { print("Tapped") }
                    MGButton(title: title, type: .focused, size: .small, color: .fill) { print("Tapped") }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ButtonTestView()
}
