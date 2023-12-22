//
//  Test2.swift
//  SoundAtMaximum
//
//  Created by jopootrivatel on 21.12.2023.
//

import SwiftUI

struct VolumeSliderView: View {
    
    @State private var sliderPosition: CGFloat = 0
    @State private var previousSliderPosition: CGFloat = 0
    @State private var sliderScale: CGFloat = 0
    
    var body: some View {
        
        let sliderHeight: CGFloat = 200
        let sliderWidth: CGFloat = 100
        let maxSliderScale: CGFloat = 0.1
        
        Rectangle()
            .frame(width: sliderWidth, height: sliderHeight)
            .background(.ultraThinMaterial)
            .gesture(
                DragGesture()
                    .onChanged { proxy in
                        let height = (sliderHeight / 2) - proxy.translation.height
                        sliderPosition = min(sliderHeight, max(0, height))
                        
                        withAnimation {
                            sliderScale = height > sliderHeight
                            ? min(maxSliderScale, 1 - sliderHeight / height)
                            : height < 0
                            ? -min(maxSliderScale, 1 - sliderHeight / (sliderHeight + abs(height)))
                            : 0
                        }
                    }
                    .onEnded { _ in
                        previousSliderPosition = sliderPosition
                        sliderScale = 0
                    }
            )
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: sliderPosition)
                    .foregroundColor(.white)
            }
            .mask(RoundedRectangle(cornerRadius: 25))
            .onAppear() {
                sliderPosition = sliderHeight / 2
                previousSliderPosition = sliderHeight / 2
            }
            .scaleEffect(
                CGSize(
                    width: 1.0 - abs(sliderScale) / 2,
                    height: 1.0 + abs(sliderScale)
                ),
                anchor: sliderScale >= 0 ? .bottom : .top
            )
        
    }
}

#Preview {
    VolumeSliderView()
}
