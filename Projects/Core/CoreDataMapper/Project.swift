//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상혁 on 2023/04/26.
//

import Foundation

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: Module.Core.CoreDataMapper.name,
    product: .framework,
    packages: [
        .SPM.RxSwift
    ],
    dependencies: [
        .Project.CoreDTO,
        .Project.CoreEntity,
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.RxRelay
    ],
    hasTests: false
)
