//
//  Functions.swift
//  JangbuRich
//
//  Created by 변상우 on 11/28/24.
//

import Foundation

public func formatDate(_ dateString: String) -> String {
    let trimmedDateString = trimMilliseconds(dateString)

    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    inputFormatter.locale = Locale(identifier: "en_US_POSIX")
    inputFormatter.timeZone = TimeZone(abbreviation: "UTC")

    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "yyyy.MM.dd"

    if let date = inputFormatter.date(from: trimmedDateString) {
        return outputFormatter.string(from: date)
    } else {
        return "Invalid Date"
    }
}

public func extractTime(_ dateString: String) -> String {
    let trimmedDateString = trimMilliseconds(dateString)

    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    inputFormatter.locale = Locale(identifier: "en_US_POSIX")
    inputFormatter.timeZone = TimeZone(abbreviation: "UTC")

    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "HH:mm"

    if let date = inputFormatter.date(from: trimmedDateString) {
        return outputFormatter.string(from: date)
    } else {
        return "Invalid Time"
    }
}

public func trimMilliseconds(_ dateString: String) -> String {
    if let range = dateString.range(of: "\\.\\d+", options: .regularExpression) {
        let milliseconds = dateString[range]
        let trimmedMilliseconds = String(milliseconds.prefix(4))
        return dateString.replacingCharacters(in: range, with: trimmedMilliseconds)
    }
    return dateString
}
