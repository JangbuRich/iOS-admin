//
//  OnboardingThirdView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct OnboardingThirdView: View {
    
    @EnvironmentObject var authStore: AuthStore
    
    @Binding var isSuccessLogin: Bool
    
    @State private var selectedStoreImage: UIImage? = nil
    @State private var storeName: String = ""
    @State private var storeIntro: String = ""
    @State private var selectedStoreTag: String? = nil
    @State private var storeLocation: String = ""
    @State private var storeLocationDetail: String = ""
    @State private var selectedDays: [String] = []
    @State private var storeStartTime: Date = Calendar.current.startOfDay(for: Date())
    @State private var storeEndTime: Date = Calendar.current.startOfDay(for: Date())
    
    @State private var isImagePickerPresented: Bool = false
    @State private var isStartTimeSheet: Bool = false
    @State private var isEndTimeSheet: Bool = false
    
    var nextButtonStatus: Bool {
        return selectedStoreImage != nil && !storeName.isEmpty && !storeIntro.isEmpty && selectedStoreTag != nil && !storeLocation.isEmpty && !selectedDays.isEmpty && !storeStartTimeString.isEmpty && !storeEndTimeString.isEmpty
    }
    
    private var storeStartTimeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: storeStartTime)
    }
    
    private var storeEndTimeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: storeEndTime)
    }
    
    let tags = ["한식", "중식", "일식", "양식", "분식", "육류", "해산물", "베트남", "멕시코", "인도", "태국", "기타"]
    
    let days = ["월", "화", "수", "목", "금", "토", "일"]

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("매장 등록을 위한 상세 정보를 입력해주세요")
                        .font(.headline1)
                        .foregroundStyle(.jgray20)
                        .padding(.top, scaledHeight(61))
                    
                    VStack(spacing: 20) {
                        VStack {
                            HStack(spacing: 0) {
                                Text("매장 대표 사진")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Text("*")
                                    .font(.body6)
                                    .foregroundStyle(.jOrange)
                                
                                Spacer()
                            }
                            .padding(.bottom, scaledHeight(10))
                            
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
                            .sheet(isPresented: $isImagePickerPresented) {
                                JImagePicker(selectedImage: $selectedStoreImage)
                            }
                        }
                        
                        JTextField(title: "매장명", placeholder: "매장명을 입력해주세요", text: $storeName, isRequired: true, isNumberPad: false, isEditable: false)
                        
                        HStack(alignment: .bottom, spacing: scaledWidth(10)) {
                            JTextField(title: "매장 소개", placeholder: "간단한 매장 소개를 입력해주세요", text: $storeIntro, isRequired: true, isNumberPad: false)
                            
                            Button {
                                print("AI, 매장 소개 작성해~")
                            } label: {
                                Image(.aiHelperButton)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(44))
                            }
                        }
                        
                        VStack {
                            HStack(spacing: 0) {
                                Text("매장 구분")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Text("*")
                                    .font(.body6)
                                    .foregroundStyle(.jOrange)
                                
                                Spacer()
                            }
                            .padding(.bottom, scaledHeight(10))
                            
                            VStack(alignment: .leading) {
                                HStack(spacing: scaledWidth(10)) {
                                    ForEach(tags.prefix(7), id: \.self) { tag in
                                        JTagButton(tag: tag, isSelected: selectedStoreTag == tag) {
                                            toggleTagSelection(tag)
                                        }
                                    }
                                }
                                
                                HStack(spacing: scaledWidth(10)) {
                                    ForEach(tags.dropFirst(7), id: \.self) { tag in
                                        JTagButton(tag: tag, isSelected: selectedStoreTag == tag) {
                                            toggleTagSelection(tag)
                                        }
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            HStack(alignment: .bottom, spacing: scaledWidth(10)) {
                                JTextField(title: "매장 위치", placeholder: "매장 위치를 검색해보세요", text: $storeLocation, isRequired: true, isNumberPad: false)
                                
                                Button {
                                    print("매장 위치 검색!! 얍!")
                                } label: {
                                    Text("검색")
                                        .font(.detail1)
                                        .foregroundStyle(.jgray100)
                                        .frame(width: scaledWidth(45), height: scaledHeight(42))
                                        .background(.jgray30)
                                        .cornerRadius(scaledWidth(10))
                                }
                            }
                            
                            TextField("상세 주소를 입력해주세요", text: $storeLocationDetail)
                                .font(.detail1)
                                .foregroundStyle(.jgray60)
                                .padding()
                                .frame(height: scaledHeight(42))
                                .background(.jgray95)
                                .cornerRadius(scaledHeight(10))
                        }
                        
                        VStack {
                            HStack(spacing: 0) {
                                Text("매장 운영 시간")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Text("*")
                                    .font(.body6)
                                    .foregroundStyle(.jOrange)
                                
                                Spacer()
                            }
                            .padding(.bottom, scaledHeight(10))
                            
                            HStack {
                                HStack(spacing: scaledWidth(10)) {
                                    ForEach(days, id: \.self) { day in
                                        JDayButton(day: day, isSelected: selectedDays.contains(day)) {
                                            toggleDaySelection(day)
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            HStack(alignment: .bottom, spacing: scaledWidth(13)) {
                                VStack(alignment: .leading) {
                                    Text("시작 시간")
                                        .font(.label1)
                                        .foregroundStyle(.jgray50)
                                    
                                    Button {
                                        isStartTimeSheet.toggle()
                                    } label: {
                                        Text(storeStartTimeString)
                                            .font(.detail2)
                                            .foregroundStyle(.jgray60)
                                    }
                                    .padding(.horizontal, scaledWidth(86))
                                    .padding(.vertical, scaledHeight(9))
                                    .background(.jgray95)
                                    .cornerRadius(scaledWidth(12))
                                    
                                    .popover(isPresented: $isStartTimeSheet) {
                                        DatePicker("", selection: $storeStartTime, displayedComponents: .hourAndMinute)
                                            .datePickerStyle(WheelDatePickerStyle())
                                            .labelsHidden()
                                    }
                                }
                                
                                RoundedRectangle(cornerRadius: scaledWidth(4))
                                    .fill(.jgray60)
                                    .frame(width: scaledWidth(16), height: scaledHeight(2))
                                    .padding(.bottom, scaledHeight(20))
                                
                                VStack(alignment: .leading) {
                                    Text("종료 시간")
                                        .font(.label1)
                                        .foregroundStyle(.jgray50)
                                    
                                    Button {
                                        isEndTimeSheet.toggle()
                                    } label: {
                                        Text(storeEndTimeString)
                                            .font(.detail2)
                                            .foregroundStyle(.jgray60)
                                    }
                                    .padding(.horizontal, scaledWidth(86))
                                    .padding(.vertical, scaledHeight(9))
                                    .background(.jgray95)
                                    .cornerRadius(scaledWidth(12))
                                    
                                    .popover(isPresented: $isEndTimeSheet) {
                                        DatePicker("", selection: $storeEndTime, displayedComponents: .hourAndMinute)
                                            .datePickerStyle(WheelDatePickerStyle())
                                            .labelsHidden()
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, scaledHeight(30))
                    .padding(.horizontal, scaledWidth(170))
                    
                    Spacer()
                    
                    JNavigationButton(destination: OnboardingFourthView(isSuccessLogin: $isSuccessLogin), label: "다음", isEnabled: nextButtonStatus)
                        .padding(.horizontal, scaledWidth(210))
                        .padding(.bottom, scaledHeight(40))
                }
                .frame(minHeight: geometry.size.height)
            }
            .scrollDisabled(true)
        }
        .customNavigationBar(title: "") {
            isSuccessLogin = false
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        .onAppear {
            storeName = authStore.onboardingUser.storeName
        }
        .onDisappear {
            authStore.onboardingStoreImage = selectedStoreImage
            authStore.onboardingUser.introduction = storeIntro
            authStore.onboardingUser.category = "ALL"
            authStore.onboardingUser.latitude = 0
            authStore.onboardingUser.longitude = 0
            authStore.onboardingUser.address = storeLocation
            authStore.onboardingUser.location = storeLocationDetail
            authStore.onboardingUser.dayOfWeek = ["MONDAY"]
            authStore.onboardingUser.openTime = storeStartTimeString
            authStore.onboardingUser.closeTime = storeEndTimeString
        }
    }
    
    func toggleTagSelection(_ tag: String) {
        if selectedStoreTag == tag {
            selectedStoreTag = nil
        } else {
            selectedStoreTag = tag
        }
    }
    
    func toggleDaySelection(_ day: String) {
        if let index = selectedDays.firstIndex(of: day) {
            selectedDays.remove(at: index)
        } else {
            selectedDays.append(day)
        }
    }
}
