//
//  AuthStore.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import AuthenticationServices
import SwiftUI

import Alamofire
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

class AuthStore: ObservableObject {
    
    @Published var isHavingToken = false
    @Published var isFinishedOnboarding = false
    
    init() {
        if ((KeychainStore.sharedKeychain.getAccessToken() ?? "") == "" && (KeychainStore.sharedKeychain.getRefreshToken() ?? "") == "") {
            isHavingToken = false
        } else {
            isHavingToken = true
        }
    }
    
    let aToken: String = KeychainStore.sharedKeychain.getAccessToken() ?? ""
    let rToken: String = KeychainStore.sharedKeychain.getRefreshToken() ?? ""
    
    func kakaoSocialLogin(completion: @escaping (Bool) -> Void) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print("카카오 로그인 에러")
                    print(error)
                } else if let accessToken = oauthToken?.accessToken {
                    let url = Config.baseURL + "user/join/owner"
                    
                    let params = [
                        "authorizationHeader": accessToken
                    ]
                    
                    AF.request(url,
                               method: .post,
                               parameters: params,
                               headers: nil
                    ).responseDecodable(of: BaseResponse<Token>.self) { response in
                        print("response: \(response)")
                        switch response.result {
                        case .success(let loginResult):
                            KeychainStore.sharedKeychain.saveAccessToken(loginResult.data?.accessToken ?? "")
                            KeychainStore.sharedKeychain.saveRefreshToken(loginResult.data?.refreshToken ?? "")
                            completion(true)
                        case .failure(let error):
                            print("로그인 Error: \(error.localizedDescription)")
                            completion(false)
                        }
                    }
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("카카오 로그인 에러")
                    print(error)
                } else if let accessToken = oauthToken?.accessToken {
                    let url = Config.baseURL + "user/join/owner"
                    
                    let params = [
                        "authorizationHeader": accessToken
                    ]
                    
                    AF.request(url,
                               method: .post,
                               parameters: params,
                               headers: nil
                    ).responseDecodable(of: BaseResponse<Token>.self) { response in
                        print("response: \(response)")
                        switch response.result {
                        case .success(let loginResult):
                            KeychainStore.sharedKeychain.saveAccessToken(loginResult.data?.accessToken ?? "")
                            KeychainStore.sharedKeychain.saveRefreshToken(loginResult.data?.refreshToken ?? "")
                            completion(true)
                        case .failure(let error):
                            print("로그인 Error: \(error.localizedDescription)")
                            completion(false)
                        }
                    }
                }
            }
        }
    }
}
