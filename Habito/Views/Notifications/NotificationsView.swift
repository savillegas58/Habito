//
//  NotificationsView.swift
//  Habito
//
//  Created by Saul on 2/6/25.
//

import SwiftUI

struct NotificationsView: View {
    @Binding var showSheet: Bool
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    showSheet.toggle()
                }){
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                }.padding(.trailing, 25)
                    .accessibilityIdentifier("NotificationXMarkButton")
            }.padding(.bottom, 20)
            
            
            ScrollView{
                NotificationCard(title: "It's time to workout!", text: "Go to the Home tab and start completing your daily challenges!", image: "dumbbell", time: "11:30 AM")
                NotificationCard()
            }.navigationTitle("Notifications").navigationBarTitleDisplayMode(.inline)
            

        }

    }
}

#Preview {
    @Previewable @State var showSheet: Bool = false
    NotificationsView(showSheet: $showSheet)
}
