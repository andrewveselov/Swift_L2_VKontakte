//
//  FriendsListTableViewController.swift
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

class FriendsListTableViewController: UITableViewController, UISearchBarDelegate {
    
    var friendsLocalUser : [UserModel] = [
        UserModel(name: "Иван Исаев", gender: .male, avatar: UIImage(named: "avatar1")!),
        UserModel(name: "Кристина Петрова", gender: .female, avatar: UIImage(named: "avatar2")!),
        UserModel(name: "Алена", gender: .female, avatar: UIImage(named: "avatar3")!),
        UserModel(name: "Рита Иванова", gender: .female, avatar: UIImage(named: "avatar2")!),
        UserModel(name: "Марина Тихомирова", gender: .female, avatar: UIImage(named: "avatar2")!)
    ]
    @IBOutlet weak var searchBar: UISearchBar!
    
    var usernameSection = [String]()
    var usernameDictionary = [String : [UserModel]]()
    
    func generateWordsDict(){
        for username in friendsLocalUser {
            
            let key = "\(username.name[username.name.startIndex])".lowercased()
            
            if var usernameValue = usernameDictionary[key]
            {
                usernameValue.append(username)
            }else{
                usernameDictionary[key] = [username]
            }
        }
        usernameSection = [String](usernameDictionary.keys)
        usernameSection = usernameSection.sorted()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateWordsDict()
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor(red: 16.0, green: 18.0, blue: 34.0, alpha: 1.0)
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        print(usernameDictionary)
        tableView.dataSource = self
        searchBar.delegate = self
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
        
    }

    // MARK: - Table view data source
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return usernameSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return usernameSection[section].uppercased()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let contactKey = usernameSection[section]
        if let contactValue = usernameDictionary[contactKey]{
            return contactValue.count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.reuseIdentifier, for: indexPath) as? FriendsCell else { return UITableViewCell()}
        
        let usernameKey = usernameSection[indexPath.section]
        
        if  let usernameValue = usernameDictionary[usernameKey.lowercased()] {
            cell.friendName?.text = usernameValue[indexPath.row].name
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
            roundSubview.image = usernameValue[indexPath.row].avatar
            
            cell.friendImageView.addSubview(shadowSubview)
            shadowSubview.addSubview(roundSubview)
        }
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return usernameSection
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = usernameSection.firstIndex(of: title) else {
            return -1
        }
        return index
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
