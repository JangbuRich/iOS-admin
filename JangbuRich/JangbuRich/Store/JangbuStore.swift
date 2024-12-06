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
    @Published var groupDetail: JangbuGroupDetail = JangbuGroupDetail(teamName: "", teamDescription: "", point: 0, remainPoint: 0, teamLeaderName: "", teamLeaderPhoneNum: "", historyResponses: [])
    
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
    
    func getPaymentGroupDetail(teamId: String) {
        let url = Config.baseURL + "store/payment_group/\(teamId)"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers
        ).responseDecodable(of: BaseResponse<JangbuGroupDetail>.self) { response in
            print("getPaymentGroupDetail response: \(response)")
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    self.groupDetail = data
                }
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
    
    func postTaxInvoice() {
        let url = Config.baseURL + "barobill/registAndReverseIssueTaxInvoice"
        
        let params = [
            "invoicerMgtNum" : "000016-R",
            "invoiceeMgtNum" : "000016-E"
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: headers
        ).responseDecodable(of: BaseResponse<Empty>.self) { response in
            print("postTaxInvoice response: \(response)")
            switch response.result {
            case .success(let result):
                print("성공")
                print("result: \(result)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getHistoryExcel(period: Int) {
        let url = Config.baseURL + "store/excel"
        
        let params = [
            "period" : period
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(KeychainStore.sharedKeychain.getAccessToken() ?? "")"
        ]
    
        AF.download(url,
                   method: .get,
                   parameters: params,
                   headers: headers
        ).validate().response { response in
            if let tempURL = response.fileURL {
                var suggestedFileName = "TestExcel.xlsx"
                if let contentDisposition = response.response?.allHeaderFields["Content-Disposition"] as? String {
                    suggestedFileName = self.parseFilename(from: contentDisposition) ?? suggestedFileName
                }
                suggestedFileName = suggestedFileName.removingPercentEncoding ?? suggestedFileName
                
                if let contentType = response.response?.allHeaderFields["Content-Type"] as? String {
                    suggestedFileName = self.adjustFileExtension(for: suggestedFileName, contentType: contentType)
                }
                if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let destinationURL = directory.appendingPathComponent(suggestedFileName)
                    do {
                        try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                        self.saveToFilesApp(url: destinationURL)
                    } catch {
                        print("Failed to move file: \(error.localizedDescription)")
                    }
                } else {
                    print("Unable to find document directory")
                }
            } else if let error = response.error {
                print("Failed to download file: \(error.localizedDescription)")
            }
        }
    }
    
    func parseFilename(from contentDisposition: String) -> String? {
        let pattern = "filename=\"(.*?)\""
        if let regex = try? NSRegularExpression(pattern: pattern, options: []),
           let match = regex.firstMatch(in: contentDisposition, options: [], range: NSRange(location: 0, length: contentDisposition.count)) {
            if let range = Range(match.range(at: 1), in: contentDisposition) {
                return String(contentDisposition[range])
            }
        }
        return nil
    }
    
    func adjustFileExtension(for fileName: String, contentType: String) -> String {
        let fileExtension: String
        switch contentType {
        case "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet":
            fileExtension = ".xlsx"
        case "application/vnd.ms-excel":
            fileExtension = ".xls"
        case "application/octet-stream":
            if fileName.hasSuffix(".xlsx") || fileName.hasSuffix(".xls") {
                fileExtension = ""
            } else {
                fileExtension = ".xlsx"  // 기본적으로 .xlsx로 저장
            }
        default:
            fileExtension = ""
        }
        
        if fileName.hasSuffix(fileExtension) {
            return fileName
        } else {
            return fileName + fileExtension
        }
    }
    
    func saveToFilesApp(url: URL) {
        let documentPicker = UIDocumentPickerViewController(forExporting: [url])
        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
            rootVC.present(documentPicker, animated: true, completion: nil)
        }
    }
}
