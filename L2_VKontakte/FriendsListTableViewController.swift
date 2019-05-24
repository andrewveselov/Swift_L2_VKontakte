//
//  FriendsListTableViewController.swift
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

class FriendsListTableViewController: UITableViewController {
    
    var friendsLocalUser : [UserModel] = [
        UserModel(name: "Иван Исаев", gender: .male, avatarURL: "https://localhost"),
        UserModel(name: "Кристина Петрова", gender: .female, avatarURL: "https://localhost"),
        UserModel(name: "Алена", gender: .female, avatarURL: "https://localhost")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsLocalUser.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.reuseIdentifier, for: indexPath) as? FriendsCell else { return UITableViewCell()}
            cell.friendName.text = friendsLocalUser[indexPath.row].name
        return cell
    }
}
