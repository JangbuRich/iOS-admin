//
//  OrderDetailPopupView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/21/24.
//

import SwiftUI

struct OrderDetailPopupView: View {
    
    @EnvironmentObject var overlayManager: OverlayManager
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    let orderDetail: OrderDetailResult
    
    var body: some View {
        VStack {
            HStack {
                Text("주문 내역")
                    .font(isSimpleMode ? .headline7 : .body6)
                    .foregroundStyle(.jgray20)
                
                Spacer()
                
                Button {
                    overlayManager.hideSheet()
                } label: {
                    Image(.xButton)
                        .resizable()
                        .scaledToFit()
                        .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                }
            }
            .padding(.bottom, scaledHeight(25))
            
            VStack(spacing: scaledHeight(20)) {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: scaledWidth(8))
                            .stroke(lineWidth: scaledWidth(2))
                            .fill(.jOrange)
                        
                        Text("\(orderDetail.id)")
                            .font(isSimpleMode ? .headline4 : .body2)
                            .foregroundStyle(.jOrange)
                    }
                    .frame(width: scaledWidth(27), height: scaledHeight(27))
                    .padding(.trailing, scaledWidth(10))
                    
                    Text(orderDetail.teamName)
                        .font(isSimpleMode ? .headline3 : .detail2)
                        .foregroundStyle(.jgray20)
                    
                    Text("|")
                        .font(isSimpleMode ? .headline3 : .body4)
                        .foregroundStyle(.jgray60)
                        .padding(.horizontal, scaledWidth(5))
                    
                    Text(orderDetail.teamUserName)
                        .font(isSimpleMode ? .headline3 : .detail2)
                        .foregroundStyle(.jgray20)
                    
                    Spacer()
                }
                .padding(.bottom, scaledHeight(25))
                
                Rectangle()
                    .fill(.jgray80)
                    .frame(height: scaledHeight(1))
                
                VStack(spacing: scaledWidth(20)) {
                    ForEach(orderDetail.menus, id: \.menuName) { menu in
                        HStack {
                            Text(menu.menuName)
                                .font(isSimpleMode ? .headline4 : .body2)
                                .foregroundStyle(.jgray30)
                            
                            Spacer()
                            
                            Text("\(menu.amount)")
                                .font(isSimpleMode ? .headline4 : .body1)
                                .foregroundStyle(.jgray20)
                                .padding(.trailing, scaledWidth(5))
                            
                            Text("개")
                                .font(isSimpleMode ? .label1 : .detail1)
                                .foregroundStyle(.jgray50)
                        }
                    }
                }
                
                VStack {
                    VStack {
                        HStack {
                            Text(formatDate(orderDetail.dateTime))
                                .font(isSimpleMode ? .label1 : .detail1)
                                .foregroundStyle(.jgray50)
                            
//                            Text("|")
//                                .font(.detail4)
//                                .foregroundStyle(.jgray70)
//                            
//                            Text(formatDate(orderDetail.dateTime))
//                                .font(.detail1)
//                                .foregroundStyle(.jgray50)
//                            
                            Spacer()
                            
                            Text("총 \(orderDetail.amount)개")
                                .font(isSimpleMode ? .detail2 : .detail1)
                                .foregroundStyle(.jgray20)
                        }
                        
                        Rectangle()
                            .fill(.jgray80)
                            .frame(height: scaledHeight(1))
                            .padding(.vertical, scaledHeight(15))
                        
                        HStack {
                            Text("합계 금액")
                                .font(isSimpleMode ? .headline4 : .detail2)
                                .foregroundStyle(.jgray20)
                            
                            Spacer()
                        }
                        .padding(.bottom, scaledHeight(15))
                        
                        HStack {
                            Text("상품 금액")
                                .font(isSimpleMode ? .headline4 : .detail1)
                                .foregroundStyle(.jgray50)
                            
                            Spacer()
                            
                            Text("\(orderDetail.totalPrice)")
                                .font(isSimpleMode ? .headline7 : .body2)
                                .foregroundStyle(.jgray30)
                        }
                        .padding(.bottom, scaledHeight(10))
                        
                        HStack {
                            Text("할인 금액")
                                .font(isSimpleMode ? .headline4 : .detail1)
                                .foregroundStyle(.jgray50)
                            
                            Spacer()
                            
                            Text("0원")
                                .font(isSimpleMode ? .headline7 : .body2)
                                .foregroundStyle(.jgray30)
                        }
                        
                        Rectangle()
                            .fill(.jgray80)
                            .frame(height: scaledHeight(1))
                            .padding(.vertical, scaledHeight(20))
                        
                        HStack {
                            Text("총 결제 금액")
                                .font(isSimpleMode ? .headline4 : .detail2)
                                .foregroundStyle(.jgray20)
                            
                            Spacer()
                            
                            Text("\(orderDetail.totalPrice)")
                                .font(isSimpleMode ? .headline1 : .headline3)
                                .foregroundStyle(.jgray30)
                        }
                    }
                    .padding(.vertical, scaledHeight(15))
                    .padding(.horizontal, scaledWidth(20))
                }
                .background(.jgray95)
                .cornerRadius(scaledWidth(10))
            }
            .padding(.bottom, scaledHeight(40))
            
            Button {
                overlayManager.hideSheet()
            } label: {
                Text("확인")
                    .font(isSimpleMode ? .headline8 : .label1)
                    .foregroundStyle(.jgray100)
                    .padding(.vertical, scaledHeight(12))
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: scaledHeight(10))
                            .fill(.jgray20)
                    )
            }
        }
        .padding(scaledWidth(20))
    }
}
