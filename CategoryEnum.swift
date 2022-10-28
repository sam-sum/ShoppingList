//
//  MAPD714 F22
//  Mid-term Test
//  Student: Sum, Chi Hung (Samuel) 300858503
//  Date:   Oct 30, 2022
//
//  CategoryEnum.swift
//  Shopping List with perset favourite items
//  Version 1.0
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
