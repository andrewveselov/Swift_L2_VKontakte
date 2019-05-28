//
//  MyGroupsTableViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 20/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//
// Swift level 2 Lesson 4 2019-05-24
// Homework
// Andrew Veselov
//
// 1. Создать свой View для аватарки. Он должен состоять из двух subview:
// 1) Должен содержать UIImageView с фотографией пользователя и быть круглой формы.
// 2) Должен находиться ниже и давать тень по периметру фотографии. Учтите, что тень будет отображена, если backgroudColor != .clear.
// 2. Предусмотреть возможность изменения ширины, цвета, прозрачности тени в interface builder. (задание на самостоятельный поиск решения).
// 3. Создать контрол «Мне нравится», с помощью которого можно поставить лайк под постом в ленте. Данный контрол должен объединять кнопку с иконкой сердца и количеством отметок рядом с ней. При нажатии на контрол нужно увеличить количество отметок, а при повторном нажатии — уменьшить (как это реализовано в приложении ВКонтакте). В состоянии, когда отметка поставлена, иконка и текст должны менять цвет.
// 4 *Сделать контрол, позволяющий выбрать букву алфавита. Он понадобится на экране списка друзей. Дизайн можно позаимствовать у оригинального приложения ВКонтакте. Должна быть возможность выбрать букву нажатием или перемещением пальца по контролу. При выборе нужно пролистывать список к первому человеку, у которого фамилия начинается на эту букву. Желательно сделать так, чтобы в этом контроле не было букв, на которые не начинается ни одна фамилия друзей из списка. (необязательное, для тех, у кого есть время)
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
