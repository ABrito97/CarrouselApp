//
//  CarrouselView.swift
//  CarrouselApp
//
//  Created by Alejandro Brito on 09/05/25.
//

import SwiftUI
import AVFoundation

struct CarrouselView: View {
    let timer = Timer.publish(every: 3.5, on: .main, in: .common).autoconnect()
    let animals: Animals
    @State var audioPlayer: AVAudioPlayer?
    @State private var selectedIndex: Int = 0
    @State var actualSound: Sound?
    
    var body: some View {
        ZStack {
            Color.secondary
                .ignoresSafeArea()

            TabView(selection: $selectedIndex) {
                ForEach(0..<animals.list.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        Image("\(animals.list[index])")
                            .resizable()
                            .tag(index)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            Button(action: {playSound()}) {
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
                ForEach(0..<animals.list.count, id: \.self) { index in
                    Capsule()
                        .fill(Color.white.opacity(selectedIndex == index ? 1 : 0.40))
                        .frame(width: 12, height: 12)
                }
                .offset(y: 370)
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedIndex = (selectedIndex + 1) % animals.list.count
            }
        }
    }
    
    func playSound() {
        audioPlayer = nil
        actualSound = animals.sounds[selectedIndex]
        
        if let url = Bundle.main.url(forResource: actualSound?.file, withExtension: actualSound?.ext) {
            do {
                audioPlayer = try AVAudioPlayer.init(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("ERROR", error)
            }

        }
    }
}



#Preview {
    CarrouselView(animals: Animals())
}
