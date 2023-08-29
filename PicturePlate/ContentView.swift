//
//  ContentView.swift
//  PicturePlate
//
//  Created by Jason Tuttle on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    let foodImages = ["Hamburger", "Spaghetti", "FriedChicken", "Taco"]
    @State private var droppedImage = Image(systemName: "photo")
    
    var body: some View {
        VStack {
            droppedImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .foregroundColor(.blue)
                .dropDestination(for: Image.self) { items, location in
                    droppedImage = items.first ?? Image(systemName: "questionmark.diamond")
                    return true
                }
                
            HStack {
                Image(systemName: "square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125)
                    .foregroundColor(.green)
                    .padding()
                Image(systemName: "square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125)
                    .foregroundColor(.red)
                    .padding()
            }
            
                HStack {
                    ForEach(foodImages, id: \.self) {
                        Image($0)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .draggable(Image($0))
                    }
                }
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
