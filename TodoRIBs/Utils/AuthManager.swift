//
//  AuthManager.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/14.
//

import Foundation
import Firebase
import RxSwift

protocol Authable: AnyObject {
  static func login(withEmail email: String, password: String) -> Observable<AuthDataResult>
}

final class AuthManager: Authable {
  
}

extension AuthManager {
  public static func login(withEmail email: String, password: String) -> Observable<AuthDataResult> {
    return Observable<AuthDataResult>.create { observer in
      Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
          observer.onError(error)
        }
        
        if let result = result {
          observer.on(.next(result))
          observer.on(.completed)
        }
      }
      return Disposables.create()
    }
  }
}
