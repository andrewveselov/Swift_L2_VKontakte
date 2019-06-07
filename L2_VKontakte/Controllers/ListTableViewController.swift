//
//  ListTableViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 30/05/2019.
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

