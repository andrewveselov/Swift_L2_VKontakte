//
//  PhotoFriendsCollectionViewController.swift
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

private let reuseIdentifier = "Cell"

class PhotoFriendsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
}
