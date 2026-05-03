//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Serge Sinkevych on 5/3/26.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let price: String
    let category: String
    let imageName: String
}

let menuItems: [MenuItem] = [
    MenuItem(title: "Greek Salad", description: "The famous Greek salad of crispy lettuce, peppers, olives, and feta cheese.", price: "$12.99", category: "Starters", imageName: "leaf.fill"),
    MenuItem(title: "Bruschetta", description: "Grilled bread with garlic, tomatoes, olive oil, and fresh basil.", price: "$7.99", category: "Starters", imageName: "circle.grid.2x2.fill"),
    MenuItem(title: "Grilled Fish", description: "Barbecued catch of the day with onion, capers, and lemon.", price: "$20.00", category: "Mains", imageName: "fish.fill"),
    MenuItem(title: "Pasta", description: "Penne with fried aubergines, tomato sauce, garlic, basil, and cheese.", price: "$18.99", category: "Mains", imageName: "fork.knife"),
    MenuItem(title: "Lemon Dessert", description: "Traditional homemade Italian lemon and ricotta cake.", price: "$6.99", category: "Desserts", imageName: "birthday.cake.fill"),
    MenuItem(title: "Lemonade", description: "Fresh homemade lemonade served cold.", price: "$4.99", category: "Drinks", imageName: "cup.and.saucer.fill")
]
