//
//  main.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/12.
//

import UIKit

private func appDelegateClassName() -> String {
  let isTesting = NSClassFromString("XCTestCase") != nil
  return isTesting ? "TodoRIBsTests.StubAppDelegate" : NSStringFromClass(AppDelegate.self)
}

_ = UIApplicationMain(
  CommandLine.argc,
  CommandLine.unsafeArgv,
  NSStringFromClass(UIApplication.self),
  appDelegateClassName()
)
