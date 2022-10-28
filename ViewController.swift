//
//  ViewController.swift
//  ShoppingList
//
//  Created by Samuel Sum on 2022-10-27.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var txtTitle: UITextField!
    var vc: PickerViewController!
    
    var blankListData: [ShoppingItem] = [
        ShoppingItem(desc: "", qty: 1),
        ShoppingItem(desc: "", qty: 1),
        ShoppingItem(desc: "", qty: 1),
        ShoppingItem(desc: "", qty: 1),
        ShoppingItem(desc: "", qty: 1),
    ]
    
    var ComputerPartsData: [ShoppingItem] = [
        ShoppingItem(desc: "Intel CPU Core i9-13900K", qty: 1),
        ShoppingItem(desc: "Helix DDR5 16GB RAM", qty: 1),
        ShoppingItem(desc: "AMD RX6700XT GPU", qty: 1),
        ShoppingItem(desc: "SamSung M2.SSD 2TB", qty: 1),
        ShoppingItem(desc: "CPU Water Cooler", qty: 1),
    ]
    
    var ChristmasData: [ShoppingItem] = [
        ShoppingItem(desc: "Christmas tree mid size", qty: 1),
        ShoppingItem(desc: "Christmas socks", qty: 1),
        ShoppingItem(desc: "Christmas cake", qty: 1),
        ShoppingItem(desc: "Gift wrapping paper", qty: 1),
        ShoppingItem(desc: "Christmas tinsel", qty: 1),
    ]

    var ElectronicData: [ShoppingItem] = [
        ShoppingItem(desc: "Mario Kart Game", qty: 1),
        ShoppingItem(desc: "Pokémon Legends: Arceus", qty: 1),
        ShoppingItem(desc: "Nintendo Switch Sports", qty: 1),
        ShoppingItem(desc: "Animal Crossing: New Horizons", qty: 1),
        ShoppingItem(desc: "Ring Fit Adventure", qty: 1),
    ]
    
    var data: [ShoppingItem] = [
        ShoppingItem(desc: "item1", qty: 1),
        ShoppingItem(desc: "item2", qty: 1),
        ShoppingItem(desc: "item3", qty: 1),
        ShoppingItem(desc: "item4", qty: 1),
        ShoppingItem(desc: "item5", qty: 1),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTitle.delegate = self
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        table.register(ShoppingListViewCell.nib(), forCellReuseIdentifier: ShoppingListViewCell.identifier)
        table.dataSource = self
        table.rowHeight = 80
        table.keyboardDismissMode = .onDrag
        // pickerview call back via delegate
        //vc = storyboard?.instantiateViewController(withIdentifier: "PickerViewController") as? PickerViewController
        //vc.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListViewCell.identifier, for: indexPath) as! ShoppingListViewCell
        cell.configure(with: data[indexPath.row], row: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    @IBAction func diddPressAddButton(_ sender: UIButton) {
        data.append(ShoppingItem(desc: "", qty: 1))
        table.reloadData()
    }
    
    @IBAction func didPressSaveButton(_ sender: UIButton) {
        let listName = txtTitle.text!
        print("List Name: \(listName)")
        var ctr = 0
        for dataItem in data {
            if !dataItem.desc.isEmpty {
                print("\(dataItem.desc): \(dataItem.qty)")
                ctr += 1
            }
        }
        if ctr == 0 {
            print("Your list is empty.")
        }
        print()
    }
    
    @IBAction func didPressCancelButton(_ sender: UIButton) {
        data = blankListData
        table.reloadData()
    }
    /*
    @IBAction func didPressPickerButton(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PickerViewController") as? PickerViewController {
            //informs the PickerViewController that the ViewController is the delegate
            vc.delegate = self
            print("Calling Picker View Controller")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //self.view.endEditing(true)
        return true
    }
    
    func didFinishSelection(index: Int) {
        print("Picker returned: \(index)")
        
        switch Category.allCases[index] {
        case Category.ComputerParts:
            txtTitle.text = Category.ComputerParts.toString()
            data = ComputerPartsData
        case Category.Christmas:
            txtTitle.text = Category.Christmas.toString()
            data = ChristmasData
        case Category.Electronic:
            txtTitle.text = Category.Electronic.toString()
            data = ElectronicData
        case Category.Grocery:
            txtTitle.text = Category.Grocery.toString()
            data = ComputerPartsData
        }
        table.reloadData()
    }

}

extension ViewController: ShoppingListViewCellDelegate {
    func textFieldDidEndEditing(with tag: Int, value: String) {
        print ("\(tag), \(value)")
        data[tag].desc = value
    }
    
    func didChangeStepperValue(with tag: Int, value: Double) {
        print ("\(tag), \(value)")
        data[tag].qty = Int(value)
    }
    
}

