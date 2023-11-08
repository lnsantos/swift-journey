//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Lucas Santos on 08/11/23.
//

import SwiftUI

struct MeetingView: View {
    
    let currentValue : Int = 10
    let maxProgress : Int = 100
    
    var body: some View {
        VStack(spacing: 16) {
            ProgressView(value: 10, total: 15)
            HStack() {
                VStack(alignment: .leading, spacing: 16) {
                    Text(LocalizedStringKey("Primeiro texto")).font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill").font(.headline)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 16) {
                    Text(LocalizedStringKey("Segundo texto")).font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill").font(.headline)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Tempo restante")
            .accessibilityValue("10 minutos")
            
            Circle().strokeBorder(lineWidth: 24.0)
            HStack {
                Text("1 de 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }.accessibilityLabel("Proximo")
            }
        }.padding(18)
    }
}

#Preview {
    MeetingView()
}
