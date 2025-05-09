//
//  AnimalCarrouselView.swift
//  CarrouselApp
//
//  Created by Alejandro Brito on 09/05/25.
//

import SwiftUI

struct AnimalCarrouselView: View {
    var body: some View {
        CarrouselView(carrouselImageNames: ["dog", "cat", "pig", "horse", "lion", "cow"])
    }
}

#Preview {
    AnimalCarrouselView()
}
