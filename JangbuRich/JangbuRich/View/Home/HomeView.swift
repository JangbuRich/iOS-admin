//
//  HomeView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var todayOrderStore: TodayOrderStore
    
    let nowReservation = [
        NowReservation(name: "김장부", numberOfPeople: "6명", reservationDate: "2024.11.23"),
        NowReservation(name: "김장부", numberOfPeople: "6명", reservationDate: "2024.11.23"),
        NowReservation(name: "김장부", numberOfPeople: "6명", reservationDate: "2024.11.23")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            
                            LottieView(animationName: "Coin animation", loopMode: .loop)
                                .frame(width: scaledWidth(302), height: scaledHeight(172))
                        }
                        
                        Spacer()
                    }
                    .zIndex(1)
                    .padding(.top, scaledHeight(75))
                    .padding(.trailing, scaledWidth(55))
                    
                    VStack {
                        VStack {
                            VStack(spacing: scaledHeight(10)) {
                                HStack {
                                    Text("오늘의 예약")
                                        .font(.headline4)
                                        .foregroundStyle(.jgray20)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    HStack {
                                        HStack {
                                            VStack {
                                                Text("일")
                                                    .font(.detail3)
                                                    .foregroundStyle(.jgray50)
                                                
                                                Text("23")
                                                    .font(.detail2)
                                                    .foregroundStyle(.jgray20)
                                            }
                                            .padding(.trailing, scaledWidth(10))
                                            
                                            RoundedRectangle(cornerRadius: scaledWidth(20))
                                                .fill(.jOrange)
                                                .frame(width: scaledWidth(3), height: scaledHeight(43))
                                                .padding(.trailing, scaledWidth(15))
                                            
                                            VStack {
                                                Image(.aiHelperButton)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: scaledHeight(24))
                                            }
                                            .padding(.trailing, scaledWidth(7))
                                            
                                            VStack {
                                                HStack {
                                                    Text("김장부")
                                                        .font(.body2)
                                                        .foregroundStyle(.jgray20)
                                                    
                                                    Image(.iconBack)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: scaledHeight(20))
                                                    
                                                    Spacer()
                                                }
                                                
                                                HStack(spacing: scaledWidth(7)) {
                                                    Text("2024.11.23")
                                                        .font(.label3)
                                                        .foregroundStyle(.jgray40)
                                                    
                                                    Text("|")
                                                        .font(.label3)
                                                        .foregroundStyle(.jgray70)
                                                    
                                                    Text("12:30")
                                                        .font(.label3)
                                                        .foregroundStyle(.jgray40)
                                                    
                                                    Text("|")
                                                        .font(.label3)
                                                        .foregroundStyle(.jgray70)
                                                    
                                                    Text("6명")
                                                        .font(.label3)
                                                        .foregroundStyle(.jgray40)
                                                    
                                                    Spacer()
                                                }
                                            }
                                            
                                            Spacer()
                                        }
                                        .padding(scaledWidth(15))
                                    }
                                    .frame(width: scaledWidth(371))
                                    .background(.jgray100)
                                    .cornerRadius(scaledWidth(10))
                                    
                                    Spacer()
                                }
                            }
                            .padding(.top, scaledHeight(80))
                            .padding(.bottom, scaledHeight(20))
                            
                            VStack(spacing: scaledHeight(10)) {
                                HStack {
                                    Text("내 매장 정보")
                                        .font(.headline4)
                                        .foregroundStyle(.jgray20)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    HStack(spacing: scaledWidth(20)) {
                                        Image(.aiHelperButton)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: scaledHeight(99))
                                            .cornerRadius(scaledWidth(8))
                                        
                                        VStack {
                                            Text("써브웨이 광교엘포트점")
                                                .font(.headline3)
                                                .foregroundStyle(.jgray20)
                                            
                                            Text("음식점 • 서울 종로구 수표로")
                                                .font(.body4)
                                                .foregroundStyle(.jgray40)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                Image(.aiHelperButton)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: scaledHeight(24))
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                        
                                        Image(.aiHelperButton)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: scaledHeight(34))
                                            .padding(.trailing, scaledWidth(5))
                                    }
                                    .padding(scaledWidth(20))
                                }
                                .frame(height: scaledHeight(139))
                                .background(.jgray100)
                                .cornerRadius(scaledWidth(10))
                            }
                            .padding(.bottom, scaledHeight(40))
                            
                            Rectangle()
                                .fill(.jgray80)
                                .frame(height: scaledHeight(2))
                                .padding(.bottom, scaledHeight(30))
                            
                            HStack(spacing: scaledWidth(20)) {
                                VStack {
                                    NavigationLink {
                                        OrderHistoryListView(isToday: true)
                                    } label: {
                                        HStack {
                                            Text("오늘 주문 내역")
                                                .font(.headline4)
                                                .foregroundStyle(.jgray20)
                                            
                                            Spacer()
                                            
                                            Image(.iconRight)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: scaledHeight(24))
                                        }
                                        .padding(.bottom, scaledHeight(15))
                                    }
                                    
                                    VStack {
                                        VStack {
                                            ForEach(todayOrderStore.todayOrderList.prefix(5), id: \.id) { order in
                                                HomeTodayOrderHistoryView(order: order)
                                            }
                                            
                                            HStack {
                                                Circle()
                                                    .fill(.jgray95)
                                                    .frame(width: scaledWidth(26), height: scaledHeight(26))
                                                
                                                Spacer()
                                                
                                                Image(.buttonKakao)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: scaledHeight(1))
                                                
                                                Spacer()
                                                
                                                Circle()
                                                    .fill(.jgray95)
                                                    .frame(width: scaledWidth(26), height: scaledHeight(26))
                                            }
                                            
                                            HStack(spacing: scaledWidth(10)) {
                                                Image(.iconCoupon)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: scaledHeight(34))
                                                
                                                HStack(spacing: scaledWidth(29)) {
                                                    VStack {
                                                        Text("오늘 총 주문")
                                                            .font(.detail2)
                                                            .foregroundStyle(.jgray30)
                                                    }
                                                    
                                                    VStack(alignment: .trailing) {
                                                        Text("총 \(todayOrderStore.todayOrderList.count)건")
                                                            .font(.label3)
                                                            .foregroundStyle(.jgray50)
                                                        
                                                        Text("\(todayOrderStore.todayTotalPrice)원")
                                                            .font(.headline2)
                                                            .foregroundStyle(.jgray20)
                                                    }
                                                }
                                            }
                                        }
                                        .padding(.vertical, scaledHeight(20))
                                        .padding(.horizontal, scaledWidth(25))
                                    }
                                    .background(.jgray100)
                                    .cornerRadius(scaledWidth(10))
                                    
                                    Spacer()
                                }
                                
                                VStack {
                                    HStack {
                                        Text("진행 중인 예약 그룹")
                                            .font(.headline4)
                                            .foregroundStyle(.jgray20)
                                        
                                        Spacer()
                                        
                                        Image(.iconRight)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: scaledHeight(24))
                                    }
                                    .padding(.bottom, scaledHeight(15))
                                    
                                    VStack(spacing: scaledHeight(15)) {
                                        ForEach(nowReservation, id: \.name) { reservation in
                                            NowReservationView(reservation: reservation)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, scaledWidth(44))
                        .padding(.trailing, scaledWidth(45))
                    }
                }
            }
            .scrollIndicators(.hidden)
            .background(.jgray95)
            .onAppear {
                todayOrderStore.getOrderToday()
            }
        }
    }
}

#Preview {
    HomeView()
}
