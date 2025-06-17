//
//  MainTapView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct MainTapView: View {
    
    @EnvironmentObject var authStore: AuthStore
    
    @State private var selectedIndex: Int = 0
    
    var tabs: [String] = [
        "홈",
        "주문 내역",
        "장부 관리",
//        "예약 관리",
        "매장 정보 관리"
    ]
    
    var normalImages: [Image] = [
        Image(.tabHome),
        Image(.tabOrderHistory),
        Image(.tabManage),
//        Image(.tabReservation),
        Image(.tabMyinfo),
    ]
    
    var selectedImages: [Image] = [
        Image(.tabHomeFill),
        Image(.tabOrderHistoryFill),
        Image(.tabManageFill),
//        Image(.tabReservationFill),
        Image(.tabMyinfoFill),
    ]
    
    var body: some View {
        HStack {
            VStack {
                Image(.jAppIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: scaledHeight(45))
                    .padding(.top, scaledHeight(65))
                
                Spacer()
                
                VStack(spacing: scaledHeight(50)) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        Button {
                            selectedIndex = index
                        } label: {
                            VStack {
                                (selectedIndex == index ? selectedImages[index] : normalImages[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(30))
                                
                                Text(tabs[index])
                                    .font(.label3)
                                    .foregroundStyle(selectedIndex == index ? .jOrange : .jgray60)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Image(.imageProfile)
                    .resizable()
                    .scaledToFit()
                    .frame(height: scaledHeight(45))
                    .padding(.bottom, scaledHeight(69))
            }
            .frame(width: scaledWidth(85))
            .background(.jgray100)

            ZStack {
                switch selectedIndex {
                case 0:
                    HomeView(selectedIndex: $selectedIndex)
                case 1:
                    OrderHistoryView()
                case 2:
                    JangbuManageView()
                case 3:
                    MyInfoView()
//                    ReservationView()
//                case 4:
//                    MyInfoView()
                default:
                    HomeView(selectedIndex: $selectedIndex)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
