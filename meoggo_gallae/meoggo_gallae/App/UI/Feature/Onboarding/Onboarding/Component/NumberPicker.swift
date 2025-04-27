//
//  NumberPicker.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/27/25.
//

import SwiftUI

struct NumberPicker: View {
    let range: ClosedRange<Int>
    let title: String
    @State private var selectedNumber: Int
    
    init(range: ClosedRange<Int>, title: String) {
        self.range = range
        self.title = title
        _selectedNumber = State(initialValue: range.lowerBound)
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Picker("Choose a number", selection: $selectedNumber) {
                    ForEach(range, id: \.self) { number in
                        Text("\(number)")
                            .textStyle(TextStyle.largebodycopy.bold)
                    }
                }
                .frame(width: 60, height: 150)
                .pickerStyle(.wheel)
                
                Text(title)
                    .textStyle(TextStyle.largebodycopy.default)
            }
        }
    }
}
