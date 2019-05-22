//
//  PhotoFriendsCollectionViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 20/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//
// Swift level 2 Lesson 2 2019-05-17
// Homework
// Andrew Veselov
//
// 1. Добавить в приложение UITabbarViewController, три UITableViewController и один UICollectionViewController.
// 2. После того, как пользователь ввел верные логин и пароль, перейти на UITabbarViewController.
// 3. Добавить две вкладки в UITabbarViewController.
// 4. На первой вкладке настроить переходы в следующем порядке: UINavigationController — UITableViewController — UICollectionViewController. Будущая вкладка для отображения друзей пользователя ВКонтакте и его фотографий. Переход с таблицы на коллекцию должен происходить по нажатию на ячейку.
// 5. На второй вкладке — в порядке: UINavigationController — UITableViewController — UITableViewController. Первый контроллер для отображения групп пользователя, второй для отображения глобального поиска групп, которые могут быть интересны пользователю. Для перехода с первой таблицы на вторую на NavigationBar необходимо создать Bar Button Item.
// В этих цепочках UINavigationController не является отдельным экраном, он нужен для управления переходами.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoFriendsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
