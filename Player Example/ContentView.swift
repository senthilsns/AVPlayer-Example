//
//  ContentView.swift
//  Player Example
//
//  Created by senthil on 08/09/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var isPlaying = true
    @State private var player = AVPlayer()
    
    var body: some View {
        VStack {
            
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                 
                .onAppear() {
                    let url = URL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!
                    player = AVPlayer(url: url)
                    player.play()
                }
            
                .onDisappear() {
                    player.pause()
                }
                .padding()
            
            Button(action: {
                       isPlaying.toggle()
                       if isPlaying {
                           player.play()
                       } else {
                           player.pause()
                       }
                   }) {
                       Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                           .font(.largeTitle)
                           .foregroundColor(.blue)
                   }
             
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
