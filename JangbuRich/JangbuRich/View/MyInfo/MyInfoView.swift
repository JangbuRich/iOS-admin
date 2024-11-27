//
//  MyInfoView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct MyInfoView: View {
    
    @EnvironmentObject var authStore: AuthStore
    @EnvironmentObject var myInfoStore: MyInfoStore
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(.iconMyinfo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: scaledWidth(28) ,height: scaledHeight(20))
                        
                        Text("매장 정보 관리")
                            .font(isSimpleMode ? .headline1 : .headline6)
                            .foregroundStyle(.jgray20)
                        
                        Spacer()
                    }
                    .padding(.top, scaledHeight(80))
                    .padding(.bottom, scaledHeight(29))
                    
                    if isSimpleMode {
                        VStack {
                            HStack {
                                Text("매장명 / 매장 소개")
                                    .font(isSimpleMode ? .headline8 : .headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            .padding(.bottom, scaledHeight(15))
                            
                            VStack {
                                HStack {
                                    JKFImage(imageUrl: myInfoStore.storeInfo.representativeImage, height: 172)
                                        .cornerRadius(scaledWidth(10))
                                    
                                    Spacer()
                                }
                                .padding(.bottom, scaledHeight(20))
                                
                                VStack {
                                    HStack {
                                        Text(myInfoStore.storeInfo.name)
                                            .font(isSimpleMode ? .body9 : .detail1)
                                            .foregroundStyle(.jgray30)
                                            .padding(.leading, scaledWidth(25))
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: scaledHeight(42))
                                    .background(.jgray90)
                                    .cornerRadius(scaledWidth(10))
                                    
                                    VStack {
                                        HStack {
                                            Text(myInfoStore.storeInfo.introduction)
                                                .font(isSimpleMode ? .body9 : .detail1)
                                                .foregroundStyle(.jgray30)
                                                .padding(.top, scaledHeight(12))
                                                .padding(.leading, scaledWidth(25))
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: scaledHeight(150))
                                    .background(.jgray90)
                                    .cornerRadius(scaledWidth(10))
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.bottom, scaledHeight(35))
                        }
                    } else {
                        VStack {
                            Image(.imageMypage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(164))
                        }
                        .padding(.bottom, scaledHeight(20))
                        
                        VStack {
                            HStack {
                                Text("매장명 / 매장 소개")
                                    .font(isSimpleMode ? .headline8 : .headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            .padding(.bottom, scaledHeight(15))
                            
                            VStack {
                                HStack(alignment: .top) {
                                    JKFImage(imageUrl: myInfoStore.storeInfo.representativeImage, height: 172)
                                        .cornerRadius(scaledWidth(10))
                                    
                                    VStack {
                                        HStack {
                                            Text(myInfoStore.storeInfo.name)
                                                .font(.detail1)
                                                .foregroundStyle(.jgray30)
                                                .padding(.leading, scaledWidth(25))
                                            
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: scaledHeight(42))
                                        .background(.jgray90)
                                        .cornerRadius(scaledWidth(10))
                                        
                                        VStack {
                                            HStack {
                                                Text(myInfoStore.storeInfo.introduction)
                                                    .font(.detail1)
                                                    .foregroundStyle(.jgray30)
                                                    .padding(.top, scaledHeight(12))
                                                    .padding(.leading, scaledWidth(25))
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: scaledHeight(150))
                                        .background(.jgray90)
                                        .cornerRadius(scaledWidth(10))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.leading, scaledWidth(20))
                                }
                            }
                            .padding(.bottom, scaledHeight(35))
                        }
                    }
                    
                    HStack(spacing: scaledWidth(20)) {
                        VStack(spacing: scaledHeight(10)) {
                            HStack {
                                Text("매장 위치")
                                    .font(isSimpleMode ? .headline8 : .headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            .padding(.bottom, scaledHeight(15))
                            
                            VStack(spacing: scaledHeight(10)) {
                                HStack {
                                    Text(myInfoStore.storeInfo.address)
                                        .font(isSimpleMode ? .body9 : .detail1)
                                        .foregroundStyle(.jgray30)
                                        .padding(.leading, scaledWidth(25))
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: isSimpleMode ? scaledHeight(51) : scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                                
                                HStack {
                                    Text(myInfoStore.storeInfo.location ?? "dd")
                                        .font(isSimpleMode ? .body9 : .detail1)
                                        .foregroundStyle(.jgray30)
                                        .padding(.leading, scaledWidth(25))
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: isSimpleMode ? scaledHeight(51) : scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                            }
                        }
                        
                        VStack(spacing: scaledHeight(10)) {
                            HStack {
                                Text("매장 운영 시간")
                                    .font(isSimpleMode ? .headline8 : .headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            .padding(.bottom, scaledHeight(15))
                            
                            VStack(spacing: scaledHeight(10)) {
                                HStack {
                                    Text(myInfoStore.storeInfo.dayOfWeek)
                                        .font(isSimpleMode ? .body9 : .detail1)
                                        .foregroundStyle(.jgray30)
                                        .padding(.leading, scaledWidth(25))
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: isSimpleMode ? scaledHeight(51) : scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                                
                                HStack {
                                    Text(myInfoStore.storeInfo.openTime + " - " + myInfoStore.storeInfo.closeTime)
                                        .font(isSimpleMode ? .body9 : .detail1)
                                        .foregroundStyle(.jgray30)
                                        .padding(.leading, scaledWidth(25))
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: isSimpleMode ? scaledHeight(51) : scaledHeight(42))
                                .background(.jgray90)
                                .cornerRadius(scaledWidth(10))
                            }
                        }
                    }
                    .padding(.bottom, scaledHeight(35))

                    VStack {
                        VStack {
                            HStack(spacing: 0) {
                                Text("메뉴")
                                    .font(isSimpleMode ? .headline8 : .headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, scaledHeight(15))
                        
                        if isSimpleMode {
                            ForEach(myInfoStore.storeInfo.menuResponses, id: \.id) { menuItem in
                                VStack {
                                    HStack(alignment: .top) {
                                        JKFImage(imageUrl: menuItem.imageUrl, height: isSimpleMode ? 106 : 100)
                                            .cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("대표")
                                                    .font(isSimpleMode ? .label1 : .label3)
                                                    .foregroundStyle(.jgray100)
                                                    .padding(.vertical, scaledHeight(2))
                                                    .padding(.horizontal, scaledWidth(10))
                                                    .background(.jOrange)
                                                    .cornerRadius(scaledWidth(25))
                                                
                                                Text(menuItem.name)
                                                    .font(isSimpleMode ? .headline4 : .body2)
                                                    .foregroundStyle(.jgray20)
                                                
                                                Spacer()
                                            }
                                            .padding(.bottom, scaledHeight(8))
                                            
                                            Text(menuItem.description)
                                                .font(isSimpleMode ? .body4 : .body3)
                                                .foregroundStyle(.jgray50)
                                                .padding(.bottom, scaledHeight(10))
                                            
                                            Text("\(menuItem.price)원")
                                                .font(isSimpleMode ? .headline8 : .detail2)
                                                .foregroundStyle(.jgray20)
                                        }
                                        .padding(.leading, scaledWidth(15))
                                    }
                                }
                                .padding(.vertical, scaledHeight(20))
                                .padding(.horizontal, scaledWidth(20))
                                .frame(maxWidth: .infinity)
                                .background(.jgray100)
                                .cornerRadius(scaledWidth(10))
                            }
                        } else {
                            LazyVGrid(columns: columns, spacing: scaledHeight(15)) {
                                ForEach(myInfoStore.storeInfo.menuResponses, id: \.id) { menuItem in
                                    VStack {
                                        HStack(alignment: .top) {
                                            JKFImage(imageUrl: menuItem.imageUrl, height: isSimpleMode ? 106 : 100)
                                                .cornerRadius(10)
                                            
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Text("대표")
                                                        .font(isSimpleMode ? .label1 : .label3)
                                                        .foregroundStyle(.jgray100)
                                                        .padding(.vertical, scaledHeight(2))
                                                        .padding(.horizontal, scaledWidth(10))
                                                        .background(.jOrange)
                                                        .cornerRadius(scaledWidth(25))
                                                    
                                                    Text(menuItem.name)
                                                        .font(isSimpleMode ? .headline4 : .body2)
                                                        .foregroundStyle(.jgray20)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.bottom, scaledHeight(8))
                                                
                                                Text(menuItem.description)
                                                    .font(isSimpleMode ? .body4 : .body3)
                                                    .foregroundStyle(.jgray50)
                                                    .padding(.bottom, scaledHeight(10))
                                                
                                                Text("\(menuItem.price)원")
                                                    .font(isSimpleMode ? .headline8 : .detail2)
                                                    .foregroundStyle(.jgray20)
                                            }
                                            .padding(.leading, scaledWidth(15))
                                        }
                                    }
                                    .padding(.vertical, scaledHeight(20))
                                    .padding(.horizontal, scaledWidth(20))
                                    .frame(maxWidth: .infinity)
                                    .background(.jgray100)
                                    .cornerRadius(scaledWidth(10))
                                }
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
            .onAppear {
                myInfoStore.getMyStoreInfo()
            }
        }
    }
}

#Preview {
    MyInfoView()
}
