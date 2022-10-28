//
//  CategoryEnum.swift
//  ShoppingList
//
//  Created by Samuel Sum on 2022-10-28.
//
fileprivate let categoryStrings = ["Computer Parts", "Christmas Gifts", "Electronic Games", "Groceries"]

enum Category: Int, CaseIterable {
    case ComputerParts = 0,
         Christmas = 1,
         Electronic = 2,
         Grocery = 3
    
    static let allValues = [ComputerParts, Christmas, Electronic, Grocery]
    
    func toString() -> String {
            return categoryStrings[self.rawValue]
        }
}
