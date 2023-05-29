//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 이준우 on 2023/05/29.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: Modules.Core(.CoreAuthentication).name,
    product: .framework,
    packages: [],
    dependencies: [
        .Project.module(.Core(.CoreEntity)).dependency,
        .SPM.RxSwift.dependency,
        .SPM.RxCocoa.dependency,
        .SPM.RxRelay.dependency,
        .SPM.KakaoSDKAuth.dependency,
        .SPM.KakaoSDKCommon.dependency,
        .SPM.KakaoSDKUser.dependency,
    ],
    resources: ["Resources/**"],
    hasTests: false
)
