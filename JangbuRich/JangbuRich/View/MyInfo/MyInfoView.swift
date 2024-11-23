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
                    
                    VStack {
                        HStack {
                            Text("매장명 / 매장 소개")
                                .font(.headline4)
                                .foregroundStyle(.jgray20)
                            
                            Spacer()
                        }
                        
                        VStack {
                            HStack {
                                Image(.imageSubway)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(172))
                                
                                Spacer()
                                
                                VStack {
                                    VStack {
                                        Text("써브웨이 광교엘포트점")
                                            .font(.detail1)
                                            .foregroundStyle(.jgray30)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: scaledHeight(42))
                                    .background(.jgray90)
                                    .cornerRadius(scaledWidth(10))
                                    
                                    VStack {
                                        Text("써브웨이 광교엘포트점")
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
                    }
                    
                    HStack {
                        VStack {
                            HStack {
                                Text("매장 위치")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            
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
                        }
                        
                        VStack {
                            HStack {
                                Text("매장 운영 시간")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            
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
                        
                        VStack {
                            HStack {
                                Text("메뉴")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            
                            
                        }
                    }

                }
                .padding(.leading, scaledWidth(44))
                .padding(.trailing, scaledWidth(45))
                
                VStack {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(0..<4, id: \.self) { _ in
                            VStack {
                                HStack {
                                    Image(.imageBmt)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: scaledHeight(100))
                                    
                                    VStack {
                                        HStack {
                                            Text("대표")
                                                .font(.label3)
                                                .foregroundStyle(.jgray100)
                                                .padding(.vertical, scaledHeight(2))
                                                .padding(.horizontal, scaledWidth(10))
                                                .background(.jOrange)
                                                .cornerRadius(scaledWidth(25))
                                            
                                            Text("이탈리안 비엠티")
                                                .font(.body2)
                                                .foregroundStyle(.jgray20)
                                        }
                                        
                                        Text("페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화!")
                                            .font(.body3)
                                            .foregroundStyle(.jgray50)
                                        
                                        Text("9,700원")
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
            .scrollIndicators(.hidden)
            .background(.jgray95)
        }
    }
}

#Preview {
    MyInfoView()
}
