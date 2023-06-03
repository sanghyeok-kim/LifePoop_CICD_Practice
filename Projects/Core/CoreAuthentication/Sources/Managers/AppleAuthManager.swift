//
//  AppleAuthManager.swift
//  Auth
//
//  Created by 이준우 on 2023/05/29.
//  Copyright © 2023 Lifepoo. All rights reserved.
//

import AuthenticationServices
import RxSwift

import CoreEntity

public final class AppleAuthManager: AuthManagable {
    
    private static var _isAlreadyInitialized = false
    public static var isAlreadyInitialized: Bool {
        _isAlreadyInitialized
    }
    
    public init() { }
    
    public static func initAuthInfo(rightAfter preparation: (() -> Void)?) {
        guard !isAlreadyInitialized else { return }
        preparation?()
        
        let serialQueue = DispatchQueue(label: "serial-queue-auth-auth")
        serialQueue.sync {
            _isAlreadyInitialized = true
        }
    }
    
    public func fetchToken() -> Single<AuthResultPossessable> {
        guard AppleAuthManager.isAlreadyInitialized else {
            return Single.error(AuthenticationError.authInfoNotInitialized)
        }
        
        let provider = ASAuthorizationAppleIDProvider()
        return provider.rx.login(scope: [.fullName, .email])
            .compactMap { $0.credential as? ASAuthorizationAppleIDCredential }
            .compactMap { $0.identityToken }
            .compactMap { String(data: $0, encoding: .utf8) }
            .map { AppleAuthResultEntity(accessToken: $0) }
            .asSingle()
    }
}
