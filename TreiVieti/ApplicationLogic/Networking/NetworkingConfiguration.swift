//
//  Networking.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 22/06/2019.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkEnvironment: String {
    case baseURL = "https://threelives-api.solomons.work/"
}

enum Endpoint: String {
    case login = "api/user/login"
    case register = "api/user/register"
    case profile = "api/user/me"
    case referrals = "api/referrals"
    func endpointURL() -> String {
        return "\(NetworkEnvironment.baseURL.rawValue)\(rawValue)"
    }
}

class Networking {
    func login(loginModel: LoginModel, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        let endpointURL = Endpoint.endpointURL(.login)()
        if let jsonData = try? JSONEncoder().encode(loginModel) {
            let decoded = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            Alamofire.request(endpointURL, method: .post, parameters: decoded as? [String: Any] as! HTTPHeaders).responseJSON { response in
                if let json = response.result.value as? [String: Any] {
                    if let token = json["token"] as? String {
                        KeychainCoordinator.saveToken(token: token)
                        success()
                    } else if json["invalid_credentials"] != nil {
                        failure(AuthError.invalidCredentials)
                    }
                } else {
                    failure(AuthError.generalError)
                }
            }
        }
    }
    func register(registerModel: RegisterModel, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        let endpointURL = Endpoint.endpointURL(.register)()
        if let jsonData = try? JSONEncoder().encode(registerModel) {
            let decoded = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            Alamofire.request(endpointURL, method: .post, parameters: decoded as? [String: Any] as! HTTPHeaders).responseJSON { response in
                if let json = response.result.value as? [String: Any] {
                    if let token = json["token"] as? String {
                        KeychainCoordinator.saveToken(token: token)
                        success()
                    } else if json["email"] != nil {
                        failure(AuthError.emailAlreadyTaken)
                    }
                } else {
                    failure(AuthError.generalError)
                }
            }
        }

    }
    func getProfile(success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        guard let token = KeychainCoordinator.token else {
            failure(ProfileError.noToken)
            return
        }
        let httpHeaders = ["token": token]
        let endpointURL = Endpoint.endpointURL(.profile)()
//        Alamofire.request(endpointURL, method: .get, headers: httpHeaders as? [String: Any] as! HTTPHeaders).responseJSON { response in
//            if let json = response.result.value as? [String: Any] {
//                print(json)
//            }
//        }
    }
}

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
