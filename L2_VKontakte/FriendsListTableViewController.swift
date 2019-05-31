//
//  FriendsListTableViewController.swift
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

class FriendsListTableViewController: UITableViewController {
    
    var friendsLocalUser : [UserModel] = [
        UserModel(name: "Иван Исаев", gender: .male, avatar: UIImage(named: "avatar1")!),
        UserModel(name: "Кристина Петрова", gender: .female, avatar: UIImage(named: "avatar2")!),
        UserModel(name: "Алена", gender: .female, avatar: UIImage(named: "avatar3")!)
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
        let imageHeight: CGFloat = 35, imageWidth: CGFloat = 35
        let xPosition = (cell.friendImageView.frame.width / 2) - (imageWidth / 2)
        let yPosition = (cell.friendImageView.frame.height / 2) - (imageHeight / 2)
        let shadowSubview = UIView(frame: CGRect(x: xPosition, y: yPosition, width: imageWidth, height: imageHeight))
        shadowSubview.clipsToBounds = false
        shadowSubview.layer.shadowColor = cell.shadowColor?.cgColor
        shadowSubview.layer.shadowOpacity = 1
        shadowSubview.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowSubview.layer.shadowRadius = cell.shadowRadius
        shadowSubview.layer.shadowPath = UIBezierPath(roundedRect: shadowSubview.bounds, cornerRadius: cell.friendImageView.frame.size.width / 2).cgPath

        let roundSubview = UIImageView(frame: shadowSubview.bounds)
        roundSubview.clipsToBounds = true
        roundSubview.layer.cornerRadius = cell.friendImageView.frame.size.width / 2
        roundSubview.layer.backgroundColor = UIColor.white.cgColor
        roundSubview.image = friendsLocalUser[indexPath.row].avatar
        
        cell.friendImageView.addSubview(shadowSubview)
        shadowSubview.addSubview(roundSubview)
        
        cell.friendName.text = friendsLocalUser[indexPath.row].name

        return cell
    }
}
