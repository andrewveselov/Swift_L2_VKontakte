//
//  ViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 15/05/2019.
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
