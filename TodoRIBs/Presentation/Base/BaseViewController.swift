//
//  BaseViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/26.
//

import AsyncDisplayKit
import RxSwift

class BaseViewController: ASDKViewController<ASDisplayNode>,
                          HasSetupConstraints,
                          HasDisposeBag {
  // MARK: - Properties
  var disposeBag = DisposeBag()
  private(set) var didSetupConstraints: Bool = false
  
  // MARK: - Deinit
  deinit {
    log.v("Deinit : \(type(of: self))")
  }
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.setNeedsUpdateConstraints()
    setupUI()
    bindUI()
  }
  
  //MARK: - Layout
  override func updateViewConstraints() {
    setupConstraintsIfNeeded()
    super.updateViewConstraints()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    if isMovingFromParent || isBeingDismissed {
      
    }
  }
  
  // MARK: - Inheritance
  func setupUI() {}
  
  func bindUI() {}
  
  func setupConstraints() {}
  
  // MARK: - Private
  func setupConstraintsIfNeeded() {
    guard !didSetupConstraints else  { return }
    setupConstraints()
    didSetupConstraints = true
  }
}
