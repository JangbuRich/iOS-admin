//
//  JangbuGroupListView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuGroupListView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let groupList: [PaymentGroup]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
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
                            
                            Text("전체 결제 그룹")
                                .font(.headline6)
                                .foregroundStyle(.jgray20)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, scaledHeight(80))
                .padding(.bottom, scaledHeight(20))
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(groupList, id: \.id) { group in
                        JangbuGroupView(jangbuGroup: group)
                    }
                }
            }
            .padding(.leading, scaledWidth(44))
            .padding(.trailing, scaledWidth(45))
        }
        .navigationBarBackButtonHidden(true)
        .scrollIndicators(.hidden)
        .background(.jgray95)
    }
}
