// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import AVFoundation

public struct SPAudioPlayer {
    
    fileprivate var player: AVAudioPlayer
    var volume: Float {
        didSet {
            player.volume = volume
        }
    }
    var fileName: String = ""
    
    init(fileName: String, volume: Float = 1) {
        self.volume = volume
        player = AVAudioPlayer()
        let url = Bundle.main.url(forResource: fileName, withExtension: nil)!
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.volume = volume
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func prepareToPlay() {
        player.prepareToPlay()
    }

    func play() {
        player.play()
    }
    
    static func notStopBackgroundMusic() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            
        }
    }
}
