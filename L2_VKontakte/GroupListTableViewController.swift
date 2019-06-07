//
//  GroupListTableViewController.swift
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

class GroupListTableViewController: UITableViewController {
    var groupList : [GroupModel] = [
        GroupModel(name: "Любители пить", icon: UIImage(named: "drink")!),
        GroupModel(name: "Любители петь", icon: UIImage(named: "music")!),
        GroupModel(name: "Любители спать", icon: UIImage(named: "sleep")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupListCell.reuseIdentifier, for: indexPath) as? GroupListCell else { return UITableViewCell() }
        cell.groupName.text = groupList[indexPath.row].name
        cell.groupImageView.image = groupList[indexPath.row].icon
        return cell
    }

}
