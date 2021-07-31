//
//  LoggedOutViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/22.
//

import RIBs
import RxSwift
import SnapKit

protocol LoggedOutPresentableListener: AnyObject {
  func loginButtonTapped(email: String?, password: String?)
}

final class LoggedOutViewController: BaseViewController, LoggedOutPresentable, LoggedOutViewControllable {
  // MARK: - Constants
  private enum UI {
    static let buttonHeight: CGFloat = 50
    
    /// Base
    static let horizontalMargin: CGFloat = 20
    static let viewVerticalSpacing: CGFloat = 10
    static let sectionVerticalSpacing: CGFloat = 20
    
    /// emailLabel
    static let emailLabelTopMargin: CGFloat = 50
    
    /// loginButton
    static let loginButtonTopMargin: CGFloat = 40
    
    
    enum Color {
      static let primaryColor: UIColor = .systemBlue
      static let primaryTextColor: UIColor = .white
      
      static let navigationBackground: UIColor = primaryColor
      static let background: UIColor = primaryTextColor
      static let navigationTitle: UIColor = primaryTextColor
      static let title: UIColor = .darkText
      static let placeholder: UIColor = .lightGray
      static let signupButtonTitle: UIColor = .darkText
      static let buttonBackground: UIColor = primaryColor
      static let buttonTilte: UIColor = primaryTextColor
    }
    
    enum Font {
      static let title = UIFont.boldSystemFont(ofSize: 24)
      static let inputTitle = UIFont.systemFont(ofSize: 15)
      static let buttonTitle = UIFont.boldSystemFont(ofSize: 20)
    }
  }
  
  // MARK: - Properties
  weak var listener: LoggedOutPresentableListener?
  
  
  // MARK: - UI
  private let emailLabel = UILabel().then {
    $0.text = "이메일"
    $0.font = UI.Font.title
  }
  
  private let emailTextField = UITextField().then {
    $0.placeholder = "E-Mail"
    $0.font = UI.Font.inputTitle
    $0.borderStyle = .roundedRect
  }
  
  private let passwordLabel = UILabel().then {
    $0.text = "비밀번호"
    $0.font = UI.Font.title
  }
  
  private let passwordTextField = UITextField().then {
    $0.placeholder = "Password"
    $0.font = UI.Font.inputTitle
    $0.isSecureTextEntry = true
    $0.borderStyle = .roundedRect
  }
  
  private let loginButton = UIButton().then {
    $0.setTitle("로그인", for: .normal)
    $0.setTitleColor(UI.Color.buttonTilte, for: .normal)
    $0.titleLabel?.font = UI.Font.buttonTitle
    $0.backgroundColor = UI.Color.buttonBackground
  }
  
  private let signupButton = UIButton().then {
    $0.setTitle("회원가입", for: .normal)
    $0.setTitleColor(UI.Color.signupButtonTitle, for: .normal)
    $0.titleLabel?.font = UI.Font.buttonTitle
  }
  
  // MARK: - Initializating & Deinitializating
  
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupUI()
    bindUI()
  }
  
  // MARK: - Layout
  private func setupNavigationBar() {
    self.navigationController?.navigationBar.barTintColor = UI.Color.navigationBackground
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UI.Color.navigationTitle]
    self.navigationItem.title = "TodoRIBs"
  }
  
  private func setupUI() {
    view.backgroundColor = UI.Color.background
    view.addSubview(emailLabel)
    view.addSubview(emailTextField)
    view.addSubview(passwordLabel)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
    view.addSubview(signupButton)
  }
  
  override func setupConstraints() {
    emailLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(UI.emailLabelTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    emailTextField.snp.makeConstraints {
      $0.top.equalTo(emailLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    passwordLabel.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(UI.sectionVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    passwordTextField.snp.makeConstraints {
      $0.top.equalTo(passwordLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    loginButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(UI.loginButtonTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
      $0.height.equalTo(UI.buttonHeight)
    }
    
    signupButton.snp.makeConstraints {
      $0.top.equalTo(loginButton.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
      $0.bottom.lessThanOrEqualToSuperview()
    }
  }
  
  // MARK: - Configuring
  
  private func bindUI() {
    
  }
  
  internal func failedLogin(error: LoginError) {
    
  }
}

extension LoggedOutViewController {
  
}
