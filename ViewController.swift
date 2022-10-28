//
//  ViewController.swift
//  ShoppingList
//
//  Created by Samuel Sum on 2022-10-27.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!

    var data: [ShoppingItem] = [
        ShoppingItem(desc: "item1", qty: 1),
        ShoppingItem(desc: "item2", qty: 1),
        ShoppingItem(desc: "item3", qty: 1),
        ShoppingItem(desc: "item4", qty: 1),
        ShoppingItem(desc: "item5", qty: 1),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(ShoppingListViewCell.nib(), forCellReuseIdentifier: ShoppingListViewCell.identifier)
        table.dataSource = self
        table.rowHeight = 80
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
        }
    }
}

extension ViewController: ShoppingListViewCellDelegate {
    func didChangeStepperValue(with tag: Int, value: Double) {
        print ("\(tag), \(value)")
    }
}
