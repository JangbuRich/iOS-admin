//
//  TodayOrderStore.swift
//  JangbuRich
//
//  Created by 변상우 on 11/24/24.
//

import SwiftUI

import Alamofire

class TodayOrderStore: ObservableObject {
    
    @Published var todayTotalPrice: Int = 0
    
    // 당일 주문 LIST
    @Published var todayOrderList: [TodayOrderList] = []
    
    // 지난 주문 LIST
    @Published var pastOrderList: [PastOrderResult] = []
    
    @Published var orderDetailResult: OrderDetailResult = OrderDetailResult(id: 0, teamName: "", teamUserName: "", menus: [], dateTime: "", amount: 0, totalPrice: 0, discountPrice: 0)
    
    func getOrderToday() {
        let url = Config.baseURL + "store/orders/today"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers
        ).responseDecodable(of: BaseResponse<TodayOrderResult>.self) { response in
            switch response.result {
            case .success(let result):
                self.todayTotalPrice = result.data?.totalPrice ?? 0
                self.todayOrderList = result.data?.ordersGetResponses ?? []
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getOrderPast() {
        let url = Config.baseURL + "store/orders/last"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers
        ).responseDecodable(of: BaseResponse<[PastOrderResult]>.self) { response in
            switch response.result {
            case .success(let result):
                self.pastOrderList = result.data ?? []
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getOrderDetail(orderId: Int, completion: @escaping (Bool) -> Void) {
        let url = Config.baseURL + "store/orders/\(orderId)"
        
        let params = [
            "orderId" : orderId
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: headers
        ).responseDecodable(of: BaseResponse<OrderDetailResult>.self) { response in
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    self.orderDetailResult = data
                    completion(true)
                }
                completion(true)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
