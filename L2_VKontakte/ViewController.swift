//
//  ViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 15/05/2019.
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

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwdField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Actions
    @IBAction func EnterBT(_ sender: Any) {
        login()
    }
    
    @IBAction func unwindSegue(unwindSegue: UIStoryboardSegue) {
        print("?Exit")
    }
    
    //MARK: - LifeCyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе -- когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    //MARK: - Keyboard
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    //MARK: - Subfunctions
    
    func login() {
        print("Username: \(loginField.text!) Password: \(passwdField.text!)")
        if  loginField.text! == "" &&
            passwdField.text! == "" {
            print("?Login success")
            performSegue(withIdentifier: "loginComplete", sender: nil)
        } else {
            print("?Login failed")
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { _ in
                self.passwdField.text! = ""
            }
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
}
