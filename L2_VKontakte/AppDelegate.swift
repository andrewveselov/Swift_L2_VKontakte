//
//  AppDelegate.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 15/05/2019.
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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

