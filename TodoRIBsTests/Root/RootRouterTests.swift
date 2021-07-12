//
//  RootRouterTests.swift
//  TodoRIBsTests
//
//  Created by Mephrine on 2021/07/12.
//

@testable import TodoRIBs
import XCTest

final class RootRouterTests: XCTestCase {
  private var loggedOutBuilder: LoggedOutBuildableMock!
  private var rootInteractor: RootInteractableMock!
  private var rootRouter: RootRouter!
  
  // TODO: declare other objects and mocks you need as private vars
  
  override func setUp() {
    super.setUp()
    loggedOutBuilder = LoggedOutBuildableMock()
    rootInteractor = RootInteractableMock()
    rootRouter = RootRouter(interactor: rootInteractor,
                            viewController: RootViewControllableMock(),
                            LoggedOutBuilder: loggedOutBuilder)
    
    // TODO: instantiate objects and mocks
  }
  
  // MARK: - Tests
  func test_routeToLoggedOut_verifyInvokeBuilderAttachReturnedRouter() {
    let loggedOutRouter = LoggedOutRoutingMock(interactable: LoggedOutInteractableMock(), viewControllable: LoggedOutViewControllableMock())
    var assignedListener: LoggedOutListener? = nil
    loggedOutBuilder.buildHandler = { (_ listener: LoggedOutListener) -> LoggedOutRouting in
      assignedListener = listener
      return loggedOutRouter
    }
    
    XCTAssertNil(assignedListener)
    XCTAssertEqual(loggedOutBuilder.buildCallCount, 0)
    XCTAssertEqual(loggedOutRouter.loadCallCount, 0)
    
    rootRouter.didLoad()
    
    XCTAssertTrue(assignedListener === rootInteractor)
    XCTAssertEqual(loggedOutBuilder.buildCallCount, 1)
    XCTAssertEqual(loggedOutRouter.loadCallCount, 1)
  }
}
