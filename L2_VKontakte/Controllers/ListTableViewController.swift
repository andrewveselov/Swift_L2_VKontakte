//
//  ListTableViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 30/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit
var listView : [ListModel] = [
    ListModel(name: "Илья", avatar: UIImage(named: "avatar1")!, message: "Проверка сообщение 1"),
    ListModel(name: "Ирина", avatar: UIImage(named: "avatar2")!, message: "Проверка сообдение 2"),
    ListModel(name: "Василий", avatar: UIImage(named: "avatar1")!, message: "Проверка сообщдение 3")
]
class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listView.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseIdentifier, for: indexPath) as? ListCell else { return UITableViewCell() }
        cell.userName.text = listView[indexPath.row].name
        cell.userImageView.image = listView[indexPath.row].avatar
        cell.message.text = listView[indexPath.row].message
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(140)
    }
    
    @objc func incraseLikes (ID: Int) {
        listView[ID].likes += 1
    }
    
    @objc func decraseLikes (ID: Int) {
        if listView[ID].likes > 0 {listView[ID].likes -= 1}
    }
    
}

