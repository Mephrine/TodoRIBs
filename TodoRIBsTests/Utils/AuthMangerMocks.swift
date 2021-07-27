//
//  AuthMangerMocks.swift
//  TodoRIBsTests
//
//  Created by Mephrine on 2021/07/14.
//

@testable import TodoRIBs
import RxSwift
import Firebase

//enum TestAuthError: Error {
//  case authError
//}

//final class AuthManagerMocks: Authable {
//  static func login(withEmail email: String, password: String) -> Observable<AuthDataResult> {
//    return Observable.create { observer in
//      if email.isEmpty || password.isEmpty {
//        observer.on(.error(TestAuthError.authError))
//      }
//      let test = AuthDataResult(test: true)
////      observer.on(.next()
//      return Disposables.create()
//    }
//  }
//}
//
//protocol TestModel {}
//
//extension AuthDataResult: TestModel {
//  convenience init(test: Bool) {
//    return AuthDataResult()
//  }
//}
