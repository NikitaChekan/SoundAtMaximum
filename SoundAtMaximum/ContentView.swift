//
//  ContentView.swift
//  SoundAtMaximum
//
//  Created by jopootrivatel on 21.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
            
            VolumeSliderView()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
