//
//  ContentView.swift
//  PicturePlate
//
//  Created by Jason Tuttle on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    let foodImages = ["Hamburger", "Spaghetti", "FriedChicken", "Taco"]
    let veggies = ["Broccoli", "Carrots", "Corn", "Green Bell Pepper", "Red Bell Pepper", "Peas"]
    @State private var droppedImage = Image(systemName: "fish")
    @State private var droppedVeggie = Image(systemName: "carrot")
    @State private var droppedFruit = Image(systemName: "leaf")
    
    var body: some View {
        VStack {
            droppedImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .foregroundColor(.blue)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 10))
                .dropDestination(for: Image.self) { items, location in
                    droppedImage = items.first ?? Image(systemName: "questionmark.diamond")
                    return true
                }
            
            HStack {
                droppedVeggie
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125)
                    .foregroundColor(.green)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.green, lineWidth: 8))
                    .dropDestination(for: Image.self) { items, location in
                        droppedVeggie = items.first ?? Image(systemName: "questionmark.diamond")
                        return true
                    }
                    .padding(.horizontal)
                droppedFruit
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125)
                    .foregroundColor(.red)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.red, lineWidth: 8))
                    .dropDestination(for: Image.self) { items, location in
                        droppedFruit = items.first ?? Image(systemName: "questionmark.diamond")
                        return true
                    }
            }
            .padding()
            ScrollView(.horizontal) {
                HStack(alignment: .center) {
                    ForEach(foodImages, id: \.self) {
                        Image($0)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 5))
                            .draggable(Image($0))
                    }
                }
                .padding(10)
            }
            ScrollView(.horizontal) {
                HStack(alignment: .center) {
                    ForEach(veggies, id: \.self) {
                        Image("Veg_\($0)")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.green, lineWidth: 5)
                            )
                            .draggable(Image("Veg_\($0)"))
                            .accessibilityLabel("Vegatable, \($0)")
                    }
                }
                .padding(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
