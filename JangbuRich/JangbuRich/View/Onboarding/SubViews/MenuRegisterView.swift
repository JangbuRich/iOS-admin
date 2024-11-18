//
//  MenuRegisterView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct MenuRegisterView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selectedStoreImage: UIImage?
    @Binding var menuName: String
    @Binding var menuDescription: String
    @Binding var menuPrice: String
    @Binding var menuItems: [MenuItem]
    
    @Binding var isRegisterMenuPresented: Bool
    @Binding var isImagePickerPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isRegisterMenuPresented.toggle()
                } label: {
                    Image(.xButton)
                        .resizable()
                        .scaledToFit()
                        .frame(height: scaledHeight(24))
                }
            }
            .padding(.bottom, scaledHeight(10))
            
            VStack {
                HStack {
                    Button {
                        isImagePickerPresented = true
                    } label: {
                        if let selectedImage = selectedStoreImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: scaledWidth(80), height: scaledHeight(80))
                                .cornerRadius(scaledWidth(10))
                        } else {
                            Image(.galleryButton)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(24))
                        }
                    }
                    .frame(width: scaledWidth(80), height: scaledHeight(80))
                    .background(
                        RoundedRectangle(cornerRadius: scaledWidth(10))
                            .fill(.jgray95)
                    )
                    
                    Spacer()
                }
                .padding(.bottom, scaledHeight(25))
                
                VStack {
                    HStack(spacing: 0) {
                        Text("매뉴 이름")
                            .font(.body2)
                            .foregroundStyle(.jgray30)
                        
                        Text("*")
                            .font(.body2)
                            .foregroundStyle(.jOrange)
                        
                        Spacer()
                    }
                    
                    TextField("메뉴 이름을 입력해주세요", text: $menuName)
                        .font(.detail1)
                        .foregroundStyle(.jgray20)
                        .padding()
                        .frame(height: scaledHeight(42))
                        .background(.jgray95)
                        .cornerRadius(scaledHeight(10))
                }
                .padding(.bottom, scaledHeight(15))
                
                VStack {
                    HStack(spacing: 0) {
                        Text("메뉴 설명")
                            .font(.body2)
                            .foregroundStyle(.jgray30)
                        
                        Spacer()
                    }
                    .padding(.bottom, scaledHeight(10))
                
                    TextField("간단한 메뉴 설명을 입력해주세요", text: $menuDescription)
                        .font(.detail1)
                        .foregroundStyle(.jgray20)
                        .padding()
                        .frame(height: scaledHeight(87))
                        .background(.jgray95)
                        .cornerRadius(scaledHeight(10))
                }
                .padding(.bottom, scaledHeight(25))
                
                VStack {
                    HStack(spacing: 0) {
                        Text("매뉴 가격")
                            .font(.body2)
                            .foregroundStyle(.jgray30)
                        
                        Text("*")
                            .font(.body2)
                            .foregroundStyle(.jOrange)
                        
                        Spacer()
                    }
                    .padding(.bottom, scaledHeight(10))
                    
                    ZStack {
                        HStack {
                            Spacer()
                            
                            Text("원")
                                .font(.detail1)
                                .foregroundStyle(.jgray40)
                                .padding(.trailing, scaledWidth(15))
                        }
                        .zIndex(1)
                        
                        TextField("0", text: $menuPrice)
                            .font(.detail1)
                            .foregroundStyle(.jgray20)
                            .padding()
                            .padding(.trailing, scaledWidth(20))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .frame(height: scaledHeight(42))
                            .background(.jgray95)
                            .cornerRadius(scaledHeight(10))
                            .onChange(of: menuPrice) {
                                menuPrice = menuPrice.filter { $0.isNumber }
                            }
                    }
                }
                .padding(.bottom, scaledHeight(40))
            }
            
            Spacer()
            
            HStack(spacing: scaledWidth(15)) {
                Button {
                    isRegisterMenuPresented.toggle()
                } label: {
                    Text("취소")
                        .font(.label1)
                        .foregroundStyle(.jgray20)
                        .padding(.horizontal, scaledWidth(47.5))
                        .padding(.vertical, scaledHeight(12))
                        .background(
                            RoundedRectangle(cornerRadius: scaledHeight(10))
                                .fill(.jgray100)
                                .stroke(.jgray70, lineWidth: scaledWidth(1))
                        )
                }
                
                Button {
                    if let image = selectedStoreImage {
                        menuItems.append(
                            MenuItem(image: Image(uiImage: image), title: menuName, subtitle: menuDescription, price: menuPrice)
                        )
                    }
                    
                    isRegisterMenuPresented.toggle()
                } label: {
                    Text("등록하기")
                        .font(.label1)
                        .foregroundStyle(.jgray100)
                        .padding(.horizontal, scaledWidth(116))
                        .padding(.vertical, scaledHeight(12))
                        .background(
                            RoundedRectangle(cornerRadius: scaledHeight(10))
                                .fill(.jgray20)
                        )
                }
            }
        }
        .padding(scaledWidth(20))
        .onTapGesture {
            self.hideKeyboard()
        }
        .onChange(of: isRegisterMenuPresented) {
            self.hideKeyboard()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            JImagePicker(selectedImage: $selectedStoreImage)
        }
    }
}
