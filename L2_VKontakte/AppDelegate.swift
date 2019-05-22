//
//  AppDelegate.swift
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

