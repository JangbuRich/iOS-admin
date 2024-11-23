//
//  MyInfoStore.swift
//  JangbuRich
//
//  Created by 변상우 on 11/24/24.
//

import SwiftUI

import Alamofire

class MyInfoStore: ObservableObject {
    
    @Published var storeInfo: StoreResult = StoreResult(id: 0, ownerId: "", name: "", category: "", representativeImage: "", reservationAvailable: false, maxReservation: 0, minPrepayment: 0, prepaymentDuration: 0, introduction: "", latitude: 0, longitude: 0, address: "", location: "", dayOfWeek: [], openTime: "", closeTime: "")
    
    func getMyStoreInfo() {
        let url = Config.baseURL + "store"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers
        ).responseDecodable(of: BaseResponse<StoreResult>.self) { response in
            print("getMyStoreInfo: \(response)")
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    self.storeInfo = data
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
