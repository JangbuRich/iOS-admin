//
//  JangbuExportExcelView.swift
//  JangbuRich
//
//  Created by 변상우 on 12/4/24.
//

import SwiftUI

struct JangbuExportExcelView: View {
    
    @EnvironmentObject var overlayManager: OverlayManager
    
    @Binding var selectedPeriod: String
    @Binding var isExportExcel: Bool
    @Binding var isFinishedExportExcel: Bool
    
    private let periods = ["1개월", "3개월", "6개월", "직접설정"]
    
    var body: some View {
        VStack {
            HStack {
                Text("엑셀로 내보내기")
                    .font(.body6)
                    .foregroundStyle(.jgray20)
                
                Spacer()
                
                Button {
                    overlayManager.hideSheet()
                } label: {
                    Image(.xButton)
                        .resizable()
                        .scaledToFit()
                        .frame(height: scaledHeight(24))
                }
            }
            .padding(.bottom, scaledHeight(10))
            
            HStack {
                Text("장부 세부 내역을 엑셀 파일로 다운받을 수 있어요")
                    .font(.detail2)
                    .foregroundStyle(.jgray40)
                    .padding(.bottom, scaledHeight(25))
                
                Spacer()
            }
            
            Rectangle()
                .fill(.jgray80)
                .frame(height: scaledHeight(1))
                .padding(.bottom, scaledHeight(20))
            
            HStack(spacing: 0) {
                Text("조회기간")
                    .font(.body2)
                    .foregroundStyle(.jgray30)
                
                Text("*")
                    .font(.body2)
                    .foregroundStyle(.jOrange)
                
                Spacer()
            }
            .padding(.bottom, scaledHeight(10))
            
            HStack {
                ForEach(periods, id: \..self) { period in
                    Button {
                        selectedPeriod = period
                    } label: {
                        Text(period)
                            .font(.detail2)
                            .foregroundStyle(selectedPeriod == period ? .jgray20 : .jgray60)
                            .padding(.vertical, scaledHeight(8))
                            .padding(.horizontal, scaledWidth(15))
                            .frame(maxWidth: .infinity)
                            .background(selectedPeriod == period ? .jgray100 : .clear)
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(selectedPeriod == period ? .jOrange : .clear, lineWidth: 1.5)
                            )
                    }
                    .padding(.horizontal, scaledWidth(6))
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: scaledHeight(50))
            .background(.jgray95)
            .cornerRadius(10)
            .padding(.bottom, scaledHeight(40))
            
            Button {
                isFinishedExportExcel.toggle()
            } label: {
                Text("내보내기")
                    .font(.label1)
                    .foregroundStyle(.jgray100)
                    .padding(.horizontal, scaledWidth(185))
                    .padding(.vertical, scaledHeight(12))
                    .background(
                        RoundedRectangle(cornerRadius: scaledHeight(10))
                            .fill(.jgray20)
                    )
            }
        }
        .padding(scaledWidth(20))
    }
}
