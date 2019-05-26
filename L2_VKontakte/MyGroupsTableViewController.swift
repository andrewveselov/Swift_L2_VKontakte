//
//  MyGroupsTableViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 20/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//
// Swift level 2 Lesson 3 2019-05-21
// Homework
// Andrew Veselov
//
// 1. Добавить на все контроллеры прототипы ячеек.
// 2. На первой вкладке UITableViewController должен отображать список друзей пользователя. В прототипе ячеек должна быть текстовая надпись с именем друга и изображением с его аватаркой.
// 3. UICollectionViewController должен отображать фото выбранного друга, соответственно, в прототипе ячейки должно быть изображение.
// 4. На второй вкладке UITableViewController должен отображать группы пользователя. Прототип должен содержать текстовую надпись для имени группы и изображение для её аватарки.
// 5. Второй UITableViewController будет отображать группы, в которых пользователь не состоит. В будущем мы добавим возможностью поиска сообщества по названию. Ячейки должны использоваться такие же, как и на прошлом контроллере.
// 6. Создать папку Model. В ней создать файлы содержащие struct, или class, описывающий профиль пользователя — User, группу ВКонтакте — Group.
// 7. Подготовить массивы демонстрационных данных, отобразить эти данные на соответствующих им экранах.
// 8. Реализовать добавление и удаление групп пользователя.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    var myGroupList : [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroupList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyGroupsCell.reuseIdentifier, for: indexPath) as? MyGroupsCell else { return UITableViewCell() }
        cell.groupName.text = myGroupList[indexPath.row].name
        cell.groupImageView.image = myGroupList[indexPath.row].icon
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if let controller = segue.source as? GroupListTableViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow {
            let group = controller.groupList[indexPath.row]
            guard !myGroupList.contains(where: { $0.name == group.name }) else { return }
            myGroupList.append(group)
            let newIndexPath = IndexPath(item: myGroupList.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
