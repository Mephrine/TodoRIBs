//
//  AppComponent.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/30.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
  init() {
    super.init(dependency: EmptyComponent())
  }
}
