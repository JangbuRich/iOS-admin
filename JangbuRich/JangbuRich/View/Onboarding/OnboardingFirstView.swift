//
//  OnboardingFirstView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    
    @EnvironmentObject var navigationPathManager: NavigationPathManager
    
    @State private var storeName: String = ""
    @State private var phoneNumber: String = ""
    @State private var name: String = ""
    @State private var businessNumber: String = ""
    @State private var selectedDate = Date()
    @State private var selectedDateString = "YY.MM.DD"
    @State private var showDatePicker = false
    @State private var nextButtonStatus = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd"
        return formatter
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("매장 등록을 위해 정보를 입력해주세요")
                        .font(.headline1)
                        .foregroundStyle(.jgray20)
                        .padding(.top, scaledHeight(61))
                    
                    VStack {
                        VStack(spacing: scaledHeight(35)) {
                            JTextField(title: "매장명", placeholder: "매장명을 입력해주세요", text: $storeName, isRequired: true, isNumberPad: false)
                            
                            JTextField(title: "전화번호", placeholder: "010 1234 5678", text: $phoneNumber, isRequired: true, isNumberPad: true)
                                .keyboardType(.numberPad)
                        }
                        
                        Rectangle()
                            .fill(.jgray90)
                            .frame(height: scaledHeight(1))
                            .padding(.vertical, scaledHeight(30))
                        
                        HStack {
                            Text("사업체 인증 정보를 입력해주세요")
                                .font(.label1)
                                .foregroundStyle(.jgray50)
                            
                            Spacer()
                        }
                        
                        VStack(spacing: scaledHeight(35)) {
                            JTextField(title: "대표자 성명", placeholder: "대표자 성명을 입력해주세요", text: $name, isRequired: true, isNumberPad: false)
                            
                            JTextField(title: "사업자등록번호", placeholder: "사업자등록번호를 입력해주세요", text: $businessNumber, isRequired: true, isNumberPad: true)
                        }
                        .padding(.top, scaledHeight(20))
                        
                        HStack(alignment: .top, spacing: 0) {
                            Text("개업일자")
                                .font(.headline4)
                                .foregroundStyle(.jgray20)
                            
                            Text("*")
                                .font(.body6)
                                .foregroundStyle(.jOrange)
                            
                            Spacer()
                            
                            Button {
                                showDatePicker.toggle()
                            } label: {
                                HStack(spacing: 10) {
                                    Image(.iconCalendar)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: scaledHeight(24))
                                    
                                    Text(selectedDateString)
                                        .font(.detail1)
                                        .foregroundStyle(.jgray60)
                                }
                            }
                            .frame(width: scaledWidth(235), height: scaledHeight(48))
                            .background(.jgray95)
                            .clipShape(RoundedRectangle(cornerRadius: scaledHeight(10)))
                        }
                        .padding(.top, scaledHeight(35))
                        
                        .popover(isPresented: $showDatePicker) {
                            DatePicker(
                                "",
                                selection: $selectedDate,
                                displayedComponents: .date
                            )
                            .datePickerStyle(.graphical)
                            .labelsHidden()
                            .frame(width: scaledWidth(350), height: scaledHeight(350))
                            .padding()
                            .onChange(of: selectedDate) {
                                selectedDateString = dateFormatter.string(from: selectedDate)
                            }
                            .onDisappear {
                                showDatePicker = false
                            }
                        }
                    }
                    .padding(.horizontal, scaledWidth(170))
                    .padding(.top, scaledHeight(100))
                    
                    Spacer()
                    
                    JNavigationButton(destination: OnboardingSecondView(), label: "다음", isEnabled: true)
                        .padding(.horizontal, scaledWidth(210))
                        .padding(.bottom, scaledHeight(40))
                }
                .frame(minHeight: geometry.size.height)
            }
            .scrollDisabled(true)
        }
        .customNavigationBar(title: "") {
            navigationPathManager.resetToRoot()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
    // 날짜 포맷팅 함수 (YY.MM.DD 형식)
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd"
        return formatter.string(from: date)
    }
}

#Preview {
    OnboardingFirstView()
}
