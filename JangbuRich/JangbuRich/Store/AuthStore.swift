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
    @Published var onboardingUser: OnboardingUser
    @Published var onboardingStoreImage: UIImage?
    @Published var onboardingMenuImage: [UIImage]?
    
    init() {
        if ((KeychainStore.sharedKeychain.getAccessToken() ?? "") == "" && (KeychainStore.sharedKeychain.getRefreshToken() ?? "") == "") {
            isHavingToken = false
        } else {
            isHavingToken = true
        }
        
        onboardingUser = OnboardingUser(storeName: "", phoneNumber: "", businessName: "", businessRegistrationNumber: "", openingDate: "", agreeMarketing: false, agreeAdvertise: false, introduction: "", category: "", latitude: 0, longitude: 0, address: "", location: "", dayOfWeek: [], openTime: "", closeTime: "", menuCreateRequestDTOS: [], minPrepayment: 0, prepaymentDuration: 0, reservationAvailable: false, maxReservation: 0)
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
    
    func createUser(user: OnboardingUser, storeImage: UIImage, menuImages: [UIImage], completion: @escaping (Bool) -> Void) {
        
        guard let storeImageData = storeImage.jpegData(compressionQuality: 0.8) else { return }
        let menuImagesData = menuImages.compactMap { $0.jpegData(compressionQuality: 0.8) }
        
        let url = Config.baseURL + "store/create"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")",
            "Content-Type": "multipart/form-data"
        ]
        
        AF.upload(multipartFormData: { multipartFormData in
            
            // 가게 세부 정보
            if let userData = try? JSONEncoder().encode(user) {
                if let jsonString = String(data: userData, encoding: .utf8) {
                    multipartFormData.append(Data(jsonString.utf8), withName: "store")
                }
            }
            
            // 가게 메인 이미지
            multipartFormData.append(storeImageData, withName: "image", fileName: "store_image.jpg", mimeType: "image/jpeg")
            
            // 메뉴 이미지
            for (index, menuImageData) in menuImagesData.enumerated() {
                multipartFormData.append(menuImageData, withName: "menuImages", fileName: "menu_image_\(index).jpg", mimeType: "image/jpeg")
            }
        }, to: url, headers: headers).response { response in
            print("response: \(response)")
            switch response.result {
            case .success(let data):
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    print("Upload Success: \(responseString)")
                    completion(true)
                }
            case .failure(let error):
                print("Upload Failed: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
