//
//  JangbuStore.swift
//  JangbuRich
//
//  Created by 변상우 on 11/24/24.
//

import SwiftUI

import Alamofire

class JangbuStore: ObservableObject {
    
    @Published var groupList: [PaymentGroup] = []
    @Published var paymentHistoryList: [PaymentHistory] = []
    
    func getPaymentGroup() {
        let url = Config.baseURL + "store/payment_group"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers
        ).responseDecodable(of: BaseResponse<[PaymentGroup]>.self) { response in
            switch response.result {
            case .success(let result):
                self.groupList = result.data ?? []
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getPaymentHistory() {
        let url = Config.baseURL + "store/payment_history"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers
        ).responseDecodable(of: BaseResponse<[PaymentHistory]>.self) { response in
            switch response.result {
            case .success(let result):
                self.paymentHistoryList = result.data ?? []
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
