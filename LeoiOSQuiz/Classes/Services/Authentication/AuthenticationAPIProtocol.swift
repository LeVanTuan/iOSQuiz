//
//  AuthenticationAPIProtocol.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/16/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PromiseKit

protocol AuthenticationAPIProtocol {
    func getAccessToken(_ input: AuthenticationInput) -> Promise<AuthenticationOutput>
}
