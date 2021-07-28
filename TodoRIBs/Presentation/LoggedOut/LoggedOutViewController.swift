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
  // MARK: - Constants
  private enum UI {
    static let buttonWidth: CGFloat = 100
    static let buttonHeight: CGFloat = 50
  }
  
  weak var listener: LoggedOutPresentableListener?
   
  
  // MARK: - Layout
  override func setupUI() {
//    let loginButton = UIButton(frame: CGRect.zero)
  }
  
  override func setupConstraints() {
    
  }
  
  // MARK: - Binding
  override func bindUI() {
    
  }
  
  internal func failedLogin(error: LoginError) {
    
  }
}

extension LoggedOutViewController {
  
}
