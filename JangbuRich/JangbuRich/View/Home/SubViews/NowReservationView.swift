//
//  NowReservationView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/20/24.
//

import SwiftUI

struct NowReservationView: View {
    var reservation: NowReservation
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(.reservationAvailable)
                        .resizable()
                        .scaledToFit()
                        .frame(height: scaledHeight(24))
                    
                    Button {
                        print("이동")
                    } label: {
                        HStack {
                            Text(reservation.name)
                                .font(.detail2)
                                .foregroundStyle(.jgray20)
                            
                            Image(.iconRight)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(20))
                        }
                    }

                    Spacer()
                }
                
                Rectangle()
                    .fill(.jgray90)
                    .frame(height: scaledHeight(1))
                    .padding(.vertical, scaledHeight(20))
                
                VStack(spacing: scaledHeight(5)) {
                    HStack {
                        Text("인원")
                            .font(.label3)
                            .foregroundStyle(.jgray60)
                        
                        Spacer()
                        
                        Text(reservation.numberOfPeople)
                            .font(.body5)
                            .foregroundStyle(.jgray30)
                    }
                    
                    HStack {
                        Text("날짜")
                            .font(.label3)
                            .foregroundStyle(.jgray60)
                        
                        Spacer()
                        
                        Text(reservation.reservationDate)
                            .font(.body5)
                            .foregroundStyle(.jgray30)
                    }
                }
            }
            .padding(scaledWidth(20))
        }
        .background(.jgray100)
        .cornerRadius(scaledWidth(10))
    }
}
