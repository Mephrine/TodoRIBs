//
//  LoggedOutInteractorTests.swift
//  TodoRIBsTests
//
//  Created by Mephrine on 2021/07/12.
//

@testable import TodoRIBs
import XCTest
import RxSwift

final class LoggedOutInteractorTests: XCTestCase {
  
  private var interactor: LoggedOutInteractor!
  var viewController: LoggedOutViewControllableMock!
  var listener: LoggedOutListenerMocks!
  var router: LoggedOutRouter!
  
  // TODO: declare other objects and mocks you need as private vars
  
  override func setUp() {
    super.setUp()
    viewController = LoggedOutViewControllableMock()
    listener = LoggedOutListenerMocks()
    
    interactor = LoggedOutInteractor(presenter: viewController)
    interactor.listener = listener
    viewController.listener = interactor
    
    router = LoggedOutRouter(interactor: interactor, viewController: viewController)
    interactor.router = router
    
    router.load()
    router.interactable.activate()
  }
  
  // MARK: - Tests
  func test_verify_email_case1() {
    viewController.listener?.loginButtonTapped(email: "abcd", password: "")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidEmailFormat)
  }
  
  func test_verify_email_case2() {
    viewController.listener?.loginButtonTapped(email: "abcd@", password: "")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidEmailFormat)
  }
  
  func test_verify_email_case3() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa", password: "")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidEmailFormat)
  }
  
  func test_verify_email_case4() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa.com", password: "")
    
    XCTAssertFalse(viewController.failedLoginError == LoginError.invalidEmailFormat)
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidPasswordFormat)
  }
  
  func test_verify_password_case1() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa.com", password: "1234")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidPasswordFormat)
  }
  
  func test_verify_password_case2() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa.com", password: "123456789")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidPasswordFormat)
  }
  
  func test_verify_password_case3() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa.com", password: "rkskekfk")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidPasswordFormat)
  }
  
  func test_verify_password_case4() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa.com", password: "rkskekfk123")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidPasswordFormat)
  }
  
  func test_verify_password_case5() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa.com", password: "rkskekfk123!")
    
    XCTAssertTrue(viewController.failedLoginError == LoginError.invalidPasswordFormat)
  }
  
  func test_verify_password_case6() {
    viewController.listener?.loginButtonTapped(email: "abcd@aaa.com", password: "Rkskekfk123!")
    
    XCTAssertFalse(viewController.failedLoginError == LoginError.invalidPasswordFormat)
  }
//  func test_login_success() {
//    let login = AuthManagerMocks.login(withEmail: "abcd@aaa.com", password: "Rkskekfk123!")
//    login.first()
//  }
//  func test_login_fail() {
//
//  }
}
