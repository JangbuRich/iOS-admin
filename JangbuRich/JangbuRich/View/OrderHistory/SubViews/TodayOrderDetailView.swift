//
//  TodayOrderDetailView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/21/24.
//

import SwiftUI

struct TodayOrderDetailView: View {
    
    @EnvironmentObject var todayOrderStore: TodayOrderStore
    
    var order: TodayOrderList
    var isToday: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: scaledWidth(8))
                    .stroke(lineWidth: scaledWidth(2))
                    .fill(isToday ? .jOrange : .jgray50)
                
                Text("\(order.id)")
                    .font(.body2)
                    .foregroundStyle(isToday ? .jOrange : .jgray50)
            }
            .background(isToday ? .jgray100 : .jgray90)
            .frame(width: scaledWidth(40), height: scaledHeight(40))
            
            VStack(alignment: .leading) {
                Text(order.menuNames)
                    .font(.body2)
                    .foregroundStyle(isToday ? .jgray30 : .jgray40)
                
                Spacer()
                
                Text("총 \(order.count)개")
                    .font(.label3)
                    .foregroundStyle(.jgray50)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("\(formatDate(order.date))")
                    .font(.label3)
                    .foregroundStyle(.jgray50)
                
                Spacer()
                
                Text("\(order.price)원")
                    .font(.label1)
                    .foregroundStyle(isToday ? .jgray20 : .jgray40)
            }
        }
        .frame(height: scaledHeight(40))
        .onAppear {
            todayOrderStore.getOrderDetail(orderId: order.id) { result in
                if result {
                    
                }
            }
        }
        
//        Rectangle()
//            .fill(.jgray80)
//            .frame(height: scaledHeight(1))
//            .padding(.vertical, scaledHeight(15))
    }
    
    func formatDate(_ dateString: String) -> String {
        // 초 소수점 자릿수를 3자리로 줄임
        let trimmedDateString = trimMilliseconds(dateString)

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS" // 수정된 입력 포맷
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy.MM.dd" // 원하는 출력 포맷

        if let date = inputFormatter.date(from: trimmedDateString) {
            return outputFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }

    func trimMilliseconds(_ dateString: String) -> String {
        if let range = dateString.range(of: "\\.\\d+", options: .regularExpression) {
            let milliseconds = dateString[range] // ".242411" 추출
            let trimmedMilliseconds = String(milliseconds.prefix(4)) // ".242"
            return dateString.replacingCharacters(in: range, with: trimmedMilliseconds)
        }
        return dateString // 변경하지 않고 반환
    }
}
