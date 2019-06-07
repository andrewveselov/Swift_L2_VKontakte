//
//  MyGroupsTableViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 20/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//
// Swift level 2 Lesson 6 2019-06-04
// Homework
// Andrew Veselov
//
// 1. Сделать группировку друзей по первой букве фамилии. Добавить header секции для таблицы со списком друзей. Он должен содержать первую букву фамилии и иметь полупрозрачный цвет фона, цвет которого совпадает с цветом таблицы.
// 2. Добавьте UISearchBar в header таблицы со списком друзей и групп. Укажите контроллер, содержащий эту таблицу, делегатом UISearchBar, реализуйте поиск с выводом результатов в ту же таблицу. Для простоты реализации не стоит использовать UISearchController (задание на самостоятельный поиск решения).
// 3. Создать экран новостей. Добавить туда таблицу и сделать ячейку для новости. Ячейка должна содержать то же самое, что и в оригинальном приложении ВКонтакте: надпись, фотографии, кнопки «Мне нравится», «Комментировать», «Поделиться» и индикатор количества просмотров. Сделать поддержку только одной фотографии, которая должна быть квадратной формы и растягиваться на всю ширину ячейки. Высота ячейки должна вычисляться автоматически.
// 4. *В ячейку новости добавить отображение нескольких фотографий. Они должны располагаться в квадратной зоне, ширина которой равна ширине ячейки. В идеале нужно сделать равномерное расположение фотографий в квадратной области (необязательное, для тех, у кого есть время).
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
