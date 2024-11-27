//
//  JangbuDetailHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/27/24.
//

import SwiftUI

struct JangbuDetailHistoryView: View {
    
    var jangbuDetailHistory: JangbuGroupDetailHistory
    
    var body: some View {
        VStack {
            HStack {
                Text("\(jangbuDetailHistory.userName)")
                    .frame(maxWidth: scaledWidth(49), alignment: .leading)
                
                Text(formatDate(jangbuDetailHistory.date))
                    .frame(maxWidth: scaledWidth(115), alignment: .leading)
                
                Text(jangbuDetailHistory.userName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("+ \(jangbuDetailHistory.price)원")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.label2)
            .foregroundStyle(.jgray50)
        }
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
