//
//  JangbuHistoryListView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuHistoryListView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var overlayManager: OverlayManager
    @EnvironmentObject var jangbuStore: JangbuStore
    
    @State private var selectedPeriod: String = "1개월"
    @State private var isExportExcel: Bool = false
    @State private var isFinishedExportExcel: Bool = false
    
    let historyList: [PaymentHistory]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: scaledWidth(10)) {
                            Image(.iconBackBlack)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(24))
                            
                            Text("전체 결제 내역")
                                .font(.headline6)
                                .foregroundStyle(.jgray20)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        isExportExcel.toggle()
                        
                        overlayManager.showSheet(JangbuExportExcelView(selectedPeriod: $selectedPeriod, isExportExcel: $isExportExcel, isFinishedExportExcel: $isFinishedExportExcel))
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: scaledWidth(25))
                                .stroke(.jgray80)
                                .fill(.jgray100)
                            
                            Text("엑셀로 내보내기")
                                .font(.label1)
                                .foregroundStyle(.jOrange)
                                .padding(.vertical, scaledHeight(4))
                                .padding(.horizontal, scaledWidth(12))
                        }
                        .frame(width: scaledWidth(125))
                    }
                }
                .padding(.top, scaledHeight(80))
                .padding(.bottom, scaledHeight(20))
                
                HStack {
                    Text("총 \(historyList.count)건")
                        .font(.detail1)
                        .foregroundStyle(.jgray50)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("#")
                            .frame(maxWidth: scaledWidth(49), alignment: .leading)
                        
                        Text("날짜")
                            .frame(maxWidth: scaledWidth(115), alignment: .leading)
                        
                        Text("그룹원")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("결제 금액")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .font(.body2)
                    .foregroundStyle(.jgray30)
                    
                    Rectangle()
                        .fill(.jgray80)
                        .frame(height: scaledHeight(1))
                        .padding(.vertical, scaledHeight(15))
                    
                    VStack(spacing: scaledHeight(20)) {
                        ForEach(historyList, id: \.id) { history in
                            JangbuHistoryView(jangbHistory: history)
                        }
                    }
                }
                .padding(scaledWidth(20))
                .background(.jgray100)
                .cornerRadius(scaledWidth(10))
            }
            .padding(.leading, scaledWidth(44))
            .padding(.trailing, scaledWidth(45))
        }
        .navigationBarBackButtonHidden(true)
        .scrollIndicators(.hidden)
        .background(.jgray95)
        .onChange(of: isFinishedExportExcel) {
            jangbuStore.getHistoryExcel(period: self.extractLeadingNumber(from: selectedPeriod) ?? 1)
            overlayManager.showSheet(JangbuFinishedExportExcelView())
        }
    }
    
    func extractLeadingNumber(from input: String) -> Int? {
        var numberString = ""
        for char in input {
            if char.isNumber {
                numberString.append(char)
            } else {
                break
            }
        }
        return Int(numberString)
    }
}
