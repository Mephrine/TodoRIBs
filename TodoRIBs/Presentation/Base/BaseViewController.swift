//
//  BaseViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/26.
//

import RxSwift

class BaseViewController: UIViewController,
                          HasSetupConstraints,
                          HasDisposeBag {
  // MARK: - Properties
  var disposeBag = DisposeBag()
  
  // MARK: - Init & Deinit
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    log.v("Deinit : \(type(of: self))")
  }
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.setNeedsUpdateConstraints()
  }
  
  //MARK: - Layout
  private(set) var didSetupConstraints: Bool = false
  
  override func updateViewConstraints() {
    setupConstraintsIfNeeded()
    super.updateViewConstraints()
  }
  
  // MARK: - Inheritance
  func setupConstraints() {}
  
  // MARK: - Private
  func setupConstraintsIfNeeded() {
    guard !didSetupConstraints else  { return }
    setupConstraints()
    didSetupConstraints = true
  }
}
