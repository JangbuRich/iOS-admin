//
//  HomeView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var todayOrderStore: TodayOrderStore
    @EnvironmentObject var myInfoStore: MyInfoStore
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    @Binding var selectedIndex: Int
    
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
                                .frame(width: scaledWidth(287), height: scaledHeight(172))
                                .padding(.top, isSimpleMode ? scaledHeight(34) : scaledHeight(10))
                                .padding(.trailing, isSimpleMode ? scaledWidth(25) : scaledHeight(60))
                        }
                        
                        Spacer()
                    }
                    .zIndex(1)
                    .padding(.top, scaledHeight(80))
                    .padding(.leading, scaledWidth(44))
                    .padding(.trailing, scaledWidth(45))
                    
                    VStack {
                        VStack {
                            VStack(spacing: scaledHeight(10)) {
                                HStack {
                                    Text("오늘의 예약")
                                        .font(isSimpleMode ? .headline1 : .headline4)
                                        .foregroundStyle(.jgray20)
                                    
                                    Spacer()
                                    
                                    Button {
                                        isSimpleMode.toggle()
                                    } label: {
                                        Image(isSimpleMode ? .toggleOn : .toggleOff)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: scaledHeight(35))
                                    }
                                }
                                
                                HStack {
                                    HStack {
                                        HStack {
                                            VStack {
                                                Text("일")
                                                    .font(isSimpleMode ? .detail1 : .detail3)
                                                    .foregroundStyle(.jgray50)
                                                
                                                Text("23")
                                                    .font(isSimpleMode ? .headline3 : .detail2)
                                                    .foregroundStyle(.jgray20)
                                            }
                                            .padding(.trailing, scaledWidth(10))
                                            
                                            RoundedRectangle(cornerRadius: scaledWidth(20))
                                                .fill(.jOrange)
                                                .frame(width: scaledWidth(3), height: scaledHeight(43))
                                                .padding(.trailing, scaledWidth(15))
                                            
                                            VStack {
                                                Image(.reservationRed)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                                            }
                                            .padding(.trailing, scaledWidth(7))
                                            
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Text("김장부")
                                                        .font(isSimpleMode ? .headline5 : .body2)
                                                        .foregroundStyle(.jgray20)
                                                    
                                                    Image(.iconRight)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: scaledHeight(20))
                                                }
                                                
                                                HStack(spacing: scaledWidth(7)) {
                                                    Text("2024.11.23")
                                                        .foregroundStyle(.jgray40)
                                                    
                                                    Text("|")
                                                        .foregroundStyle(.jgray70)
                                                    
                                                    Text("12:30")
                                                        .foregroundStyle(.jgray40)
                                                    
                                                    Text("|")
                                                        .foregroundStyle(.jgray70)
                                                    
                                                    Text("6명")
                                                        .foregroundStyle(.jgray40)
                                                }
                                                .font(isSimpleMode ? .label1 : .label3)
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
                                Button {
                                    selectedIndex = 3
                                } label: {
                                    VStack {
                                        HStack {
                                            Text("내 매장 정보")
                                                .font(isSimpleMode ? .headline1 : .headline4)
                                                .foregroundStyle(.jgray20)
                                            
                                            Spacer()
                                        }
                                        .padding(.bottom, scaledHeight(10))
                                        
                                        HStack {
                                            HStack(spacing: scaledWidth(20)) {
                                                AsyncImage(url: URL(string: myInfoStore.storeInfo.representativeImage)) { phase in
                                                    switch phase {
                                                    case .empty:
                                                        ProgressView()
                                                    case .success(let image):
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                    case .failure:
                                                        Image(systemName: "photo") // 오류 시 기본 이미지
                                                            .resizable()
                                                            .scaledToFit()
                                                    @unknown default:
                                                        EmptyView()
                                                    }
                                                }
                                                .scaledToFit()
                                                .frame(height: scaledHeight(99))
                                                .cornerRadius(scaledWidth(8))
                                                
                                                VStack {
                                                    HStack {
                                                        Text("구름스토어")
                                                            .font(.headline3)
                                                            .foregroundStyle(.jgray20)
                                                        
                                                        Spacer()
                                                    }
                                                    
                                                    HStack {
                                                        Text("음식점 • 서울특별시 구름구 하늘로")
                                                            .font(isSimpleMode ? .headline4 : .body4)
                                                            .foregroundStyle(.jgray40)
                                                        
                                                        Spacer()
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    HStack {
                                                        Image(.reservationRed)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                                                        
                                                        Spacer()
                                                    }
                                                }
                                                
                                                Image(isSimpleMode ? .iconMoreRightFill : .iconRightFill)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: isSimpleMode ? scaledHeight(40) : scaledHeight(34))
                                                    .padding(.trailing, scaledWidth(5))
                                            }
                                            .padding(scaledWidth(20))
                                        }
                                        .frame(height: scaledHeight(139))
                                        .background(.jgray100)
                                        .cornerRadius(scaledWidth(10))
                                    }
                                }
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
                                                .font(isSimpleMode ? .headline1 : .headline4)
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
                                            
                                            HStack(spacing: scaledWidth(10)) {
                                                Image(.iconCoupon)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: scaledHeight(34))
                                                
                                                HStack(spacing: scaledWidth(29)) {
                                                    VStack {
                                                        Text("오늘 총 주문")
                                                            .font(isSimpleMode ? .headline3 : .detail2)
                                                            .foregroundStyle(.jgray30)
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .trailing) {
                                                        Text("총 \(todayOrderStore.todayOrderList.count)건")
                                                            .font(isSimpleMode ? .label1 : .label3)
                                                            .foregroundStyle(.jgray50)
                                                        
                                                        Text("\(todayOrderStore.todayTotalPrice)원")
                                                            .font(isSimpleMode ? .headline6 : .headline2)
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
                                
                                if !isSimpleMode {
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
                myInfoStore.getMyStoreInfo()
            }
        }
    }
}
