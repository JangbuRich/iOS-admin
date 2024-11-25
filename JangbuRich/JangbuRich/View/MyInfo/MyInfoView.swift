//
//  MyInfoView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct MyInfoView: View {
    
    @EnvironmentObject var authStore: AuthStore
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(.iconMyinfo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: scaledWidth(28),height: scaledHeight(20))
                        
                        Text("매장 정보 관리")
                            .font(.headline6)
                            .foregroundStyle(.jgray20)
                        
                        Spacer()
                    }
                    .padding(.top, scaledHeight(80))
                    .padding(.bottom, scaledHeight(20))
                    
                    VStack {
                        Image(.imageMypage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(164))
                    }
                    .padding(.vertical, scaledHeight(10))
                    
                    VStack {
                        HStack {
                            Text("매장명 / 매장 소개")
                                .font(.headline4)
                                .foregroundStyle(.jgray20)
                            
                            Spacer()
                        }
                        .padding(.vertical, scaledHeight(10))
                        
                        VStack {
                            HStack {
                                Image(.imageMyinfoStore)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(172))
                                    .cornerRadius(scaledWidth(10))
                                
                                Spacer()
                                
                                VStack {
                                    VStack {
                                        Text("구름스토어")
                                            .font(.detail1)
                                            .foregroundStyle(.jgray30)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: scaledHeight(42))
                                    .background(.jgray90)
                                    .cornerRadius(scaledWidth(10))
                                    
                                    VStack {
                                        Text("NO 1, 달달 폭신 스토어")
                                            .font(.detail1)
                                            .foregroundStyle(.jgray30)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: scaledHeight(150))
                                    .background(.jgray90)
                                    .cornerRadius(scaledWidth(10))
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.vertical, scaledHeight(10))
                    }
                    
                    HStack {
                        VStack {
                            HStack {
                                Text("매장 위치")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            .padding(.vertical, scaledHeight(10))
                            
                            VStack {
                                VStack {
                                    Text("경기 수원시 영통구 광교중앙로 145")
                                        .font(.detail1)
                                        .foregroundStyle(.jgray30)
                                        .frame(maxWidth: .infinity)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                                
                                VStack {
                                    Text("광교엘포트아이파크 1층")
                                        .font(.detail1)
                                        .foregroundStyle(.jgray30)
                                        .frame(maxWidth: .infinity)
                                }
                                .frame(height: scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                            }
                            .padding(.vertical, scaledHeight(10))
                        }
                        
                        VStack {
                            HStack {
                                Text("매장 운영 시간")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            .padding(.vertical, scaledHeight(10))
                            
                            VStack {
                                VStack {
                                    Text("매일")
                                        .font(.detail1)
                                        .foregroundStyle(.jgray30)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                                
                                VStack {
                                    Text("08:00 - 22:00")
                                        .font(.detail1)
                                        .foregroundStyle(.jgray30)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                            }
                        }
                    }

                    VStack {
                        VStack {
                            HStack {
                                Text("메뉴")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                        }
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(0..<4, id: \.self) { _ in
                                VStack {
                                    HStack {
                                        Image(.myinfoMenus)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: scaledHeight(100))
                                            .cornerRadius(10)
                                        
                                        Spacer()
                                        
                                        VStack {
                                            HStack {
                                                Text("대표")
                                                    .font(.label3)
                                                    .foregroundStyle(.jgray100)
                                                    .padding(.vertical, scaledHeight(2))
                                                    .padding(.horizontal, scaledWidth(10))
                                                    .background(.jOrange)
                                                    .cornerRadius(scaledWidth(25))
                                                
                                                Text("구름 정식")
                                                    .font(.body2)
                                                    .foregroundStyle(.jgray20)
                                            }
                                            
                                            Text("든든한 한끼를 위한 구름 정식")
                                                .font(.body3)
                                                .foregroundStyle(.jgray50)
                                            
                                            Text("8,700원")
                                                .font(.detail2)
                                                .foregroundStyle(.jgray20)
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .background(.jgray100)
                                .cornerRadius(scaledWidth(10))
                            }
                        }
                    }
                    .padding(.bottom, scaledHeight(76))
                }
                .padding(.leading, scaledWidth(44))
                .padding(.trailing, scaledWidth(45))
            }
            .scrollIndicators(.hidden)
            .background(.jgray95)
        }
    }
}

#Preview {
    MyInfoView()
}
