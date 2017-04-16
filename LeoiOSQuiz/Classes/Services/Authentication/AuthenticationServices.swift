//
//  AuthenticationServices.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/16/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PromiseKit

class AuthenticationServices: APIServices, AuthenticationAPIProtocol {
    func getAccessToken(_ input: AuthenticationInput) -> Promise<AuthenticationOutput> {
        return self.request(input)
    }
}
