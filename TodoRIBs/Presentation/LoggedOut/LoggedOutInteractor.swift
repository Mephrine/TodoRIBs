//
//  LoggedOutInteractor.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/22.
//

import Firebase
import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
  
}

protocol LoggedOutPresentable: Presentable {
  var listener: LoggedOutPresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
  func failedLogin(error: LoginError)
}

protocol LoggedOutListener: AnyObject {
  func login()
}

enum LoginError {
  case invalidEmailFormat
  case invalidPasswordFormat
  case invalidUserInformation
  
  func message() -> String {
    switch self {
    case .invalidEmailFormat:
      return "이메일을 다시 확인해주세요."
    case .invalidPasswordFormat:
      return "올바르지 않은 비밀번호입니다."
    case .invalidUserInformation:
      return "로그인 정보를 다시 확인해주세요."
    }
  }
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {
  
  weak var router: LoggedOutRouting?
  weak var listener: LoggedOutListener?
  
  let disposeBag = DisposeBag()
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: LoggedOutPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    // TODO: Implement business logic here.
  }
  
  override func willResignActive() {
    super.willResignActive()
    // TODO: Pause any business logic.
  }
  
  func loginButtonTapped(email: String?, password: String?) {
    guard verify(email: email) else {
      presenter.failedLogin(error: LoginError.invalidEmailFormat)
      return
    }
    guard verify(password: password) else {
      presenter.failedLogin(error: LoginError.invalidPasswordFormat)
      return
    }
    
    tryToLogin(email: email!, password: password!)
  }
  
  private func verify(email: String?) -> Bool {
    let emailRegularExpression = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
    return email.isValid(regex: emailRegularExpression)
  }
  
  private func verify(password: String?) -> Bool {
    let passwordRegularExpression = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
    return password.isValid(regex: passwordRegularExpression)
  }
  
  private func tryToLogin(email: String, password: String) {
    AuthManager.login(withEmail: email, password: password)
      .observeOn(MainScheduler.instance)
      .subscribe { result in
        self.listener?.login()
      } onError: { error in
        self.presenter.failedLogin(error: LoginError.invalidUserInformation)
      }.disposed(by: disposeBag)
//    Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
//      guard let `self` = self else { return }
//      if user != nil {
//        self.listener?.login()
//      } else {
//        self.presenter.failedLogin(error: LoginError.invalidUserInformation)
//      }
//    }
  }
}

protocol FirebaseAuth {
  
}

extension Auth: FirebaseAuth {

}

fileprivate extension Optional where Wrapped == String {
//  func match(regex: String) -> Bool {
//    guard let `self` = self else { return false }
//    do {
//      let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
//      let range = NSRange(self.startIndex..., in: self)
//      let results = regex.matches(in: self, options: [], range: range)
//      let matchedString = results.map {
//        let range = Range($0.range, in: self)!
//        String(self[range])
//      }
//      return matchedString.count == 1 && matchedString[0] == self
//    } catch let error {
//      log.e(error)
//      return false
//    }
//  }
  
  func isValid(regex: String) -> Bool {
    guard let `self` = self else { return false }
    
    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return predicate.evaluate(with: self)
  }
}
