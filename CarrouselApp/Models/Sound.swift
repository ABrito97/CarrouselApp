//
//  Sound.swift
//  CarrouselApp
//
//  Created by Alejandro Brito on 09/05/25.
//

import Foundation

struct Sound {
    var file: String
    var ext: String
    
    var soundFile: String {
        "\(file).\(ext)"
    }
}
