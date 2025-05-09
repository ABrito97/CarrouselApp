//
//  CarrouselView.swift
//  CarrouselApp
//
//  Created by Alejandro Brito on 09/05/25.
//

import SwiftUI

struct CarrouselView: View {
    var carrouselImageNames: [String]
    let timer = Timer.publish(every: 3.5, on: .main, in: .common).autoconnect()
    
    @State private var selectedImageIndex: Int = 0

    var body: some View {
        ZStack {
            Color.secondary
                .ignoresSafeArea()

            TabView(selection: $selectedImageIndex) {
                ForEach(0..<carrouselImageNames.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        Image("\(carrouselImageNames[index])")
                            .resizable()
                            .tag(index)
                            .frame(width: .infinity, height: .infinity)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
            }
            .frame(height: .infinity)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            Button(action: {}) {
                   Image(systemName: "speaker.wave.3")
                     .padding()
                     .foregroundColor(.white)
                     .background(.orange)
                     .cornerRadius(27)
            }
            .controlSize(.extraLarge)
            .offset(y: 300)
            .shadow(color: .white, radius: 15, y: 5)

            HStack {
                ForEach(0..<carrouselImageNames.count, id: \.self) { index in
                    Capsule()
                        .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 35, height: 8)
                }
                .offset(y: 400)
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % carrouselImageNames.count
            }
        }
    }
}

#Preview {
    CarrouselView(carrouselImageNames: ["dog", "cat", "pig", "horse", "lion", "cow"])
}
