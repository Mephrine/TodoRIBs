//
//  LoggedOutViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/22.
//

import RIBs
import RxSwift

protocol LoggedOutPresentableListener: AnyObject {
  func loginButtonTapped(email: String?, password: String?)
}

final class LoggedOutViewController: BaseViewController, LoggedOutPresentable, LoggedOutViewControllable {
  
  weak var listener: LoggedOutPresentableListener?
 
  func failedLogin(error: LoginError) {
    
  }
}
