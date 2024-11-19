//
//  OnboardingFourthView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct OnboardingFourthView: View {
    
    @EnvironmentObject var navigationPathManager: NavigationPathManager
    
    @State private var selectedStoreImage: UIImage? = nil
    @State private var menuName: String = ""
    @State private var menuDescription: String = ""
    @State private var menuPrice: String = ""
    
    @State private var isRegisterMenuPresented: Bool = false
    @State private var isImagePickerPresented: Bool = false
    
    @State private var menuItems: [MenuItem] = []
    
//    let menuItems = [
//        MenuItem(image: Image(.jAppIcon), title: "대표 이탈리안 비엠티", subtitle: "페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화!", price: "9,700원"),
//        MenuItem(image: Image(.jAppIcon), title: "풀드포크 바비큐", subtitle: "아메리칸 스타일로 풀드포크 바비큐 본연의 맛을 만나보세요", price: "10,200원"),
//        MenuItem(image: Image(.jAppIcon), title: "쉬림프 에그마요 랩 세트", subtitle: "고소한 에그마요와 탱글한 통새우의 부드럽고 담백한 조화", price: "9,000원")
//    ]
    
    var body: some View {
        ZStack {
            VStack {
                Text("메뉴를 등록해주세요")
                    .font(.headline1)
                    .foregroundStyle(.jgray20)
                    .padding(.top, scaledHeight(61))
                
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: scaledWidth(8))
                        .fill(.jOrange)
                        .frame(width: scaledWidth(267), height: scaledHeight(26))
                        .zIndex(1)
                    
                    VStack {
                        ScrollView {
                            VStack(spacing: scaledHeight(20)) {
                                if !menuItems.isEmpty {
                                    ForEach(menuItems, id: \.title) { item in
                                        MenuItemView(item: item)
                                    }
                                }
                                
                                Button {
                                    isRegisterMenuPresented.toggle()
                                    
                                    selectedStoreImage = nil
                                    menuName = ""
                                    menuDescription = ""
                                    menuPrice = ""
                                } label: {
                                    VStack(spacing: scaledHeight(10)) {
                                        Image(.iconMenuPlus)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: scaledHeight(34))
                                        
                                        Text("메뉴 등록하기")
                                            .font(.label1)
                                            .foregroundStyle(.jgray40)
                                    }
                                    .padding(.vertical, scaledHeight(36))
                                }
                                .frame(maxWidth: .infinity)
                                .background(.jgray100)
                                .cornerRadius(scaledWidth(10))
                            }
                            .padding(.horizontal, scaledWidth(30))
                            .padding(.bottom, scaledHeight(25))
                            
                        }
                        .padding(.top, scaledHeight(33))
                        .scrollIndicators(.hidden)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: scaledHeight(678))
                    .background(.jgray95)
                    .cornerRadius(scaledWidth(20))
                    .padding(.top, scaledHeight(13))
                    .padding(.horizontal, scaledWidth(140))
                }
                .padding(.top, scaledHeight(27))
                
                Spacer()
                
                JNavigationButton(destination: OnboardingFifthView(), label: "다음", isEnabled: true)
                    .padding(.horizontal, scaledWidth(210))
                    .padding(.bottom, scaledHeight(40))
            }
            .padding(.top, scaledHeight(61))
            .padding(.bottom, scaledHeight(40))
            
            JPopupView(isPresented: $isRegisterMenuPresented, content: {
                MenuRegisterView(selectedStoreImage: $selectedStoreImage, menuName: $menuName, menuDescription: $menuDescription, menuPrice: $menuPrice, menuItems: $menuItems, isRegisterMenuPresented: $isRegisterMenuPresented, isImagePickerPresented: $isImagePickerPresented)
            })
        }
        .customNavigationBar(title: "") {
            navigationPathManager.resetToRoot()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            JImagePicker(selectedImage: $selectedStoreImage)
        }
    }
}

#Preview {
    OnboardingFourthView()
}
