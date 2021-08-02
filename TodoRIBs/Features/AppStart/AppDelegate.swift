//
//  AppDelegate.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/30.
//

import UIKit
import RIBs
import RxSwift
import Firebase
import FirebaseMessaging
import UserNotifications

final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if #available(iOS 13.0, *) {} else {
      let window = UIWindow(frame: UIScreen.main.bounds)
      
      let launchRouter = RootBuilder(dependency: AppComponent()).build()
      self.launchRouter = launchRouter
      launchRouter.launch(from: window)
    }
    
    configureFirebase()
    configurePushNotification(application: application)
    
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
  
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }
  
  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("error : \(error)")
  }
  
  private var launchRouter: LaunchRouting?
  
  private func configureFirebase() {
    FirebaseApp.configure()
  }
  
  private func configurePushNotification(application: UIApplication) {
    Messaging.messaging().delegate = self
    
    let center = UNUserNotificationCenter.current()
    center.delegate = self
    
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound, .providesAppNotificationSettings]
    center.requestAuthorization(options: authOptions) { granted, error in
      guard error == nil else {
        print("Failed requesting notification permission: ", error ?? "")
        return
      }
      if (granted) {
        print("allow permission")
      } else {
        print("deny permission")
      }
    }
    
    application.registerForRemoteNotifications()
  }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo
    print("userInfo : \(userInfo)")
    
    Messaging.messaging().appDidReceiveMessage(userInfo)
    
    completionHandler([.alert, .sound])
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    print("userInfo : \(userInfo)")
    
    Messaging.messaging().appDidReceiveMessage(userInfo)
    
    completionHandler()
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
    // 푸시 수신 동의 / 마케팅 수신 동의 등 푸시 설정을 변경할 수 있는 화면으로 이동 필요.
  }
}

extension AppDelegate: MessagingDelegate {
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("updated fcm token : \(fcmToken ?? "nil token")")
    
  }
}
