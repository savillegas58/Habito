//
//  HabitDetails.swift
//  Habito
//
//  Created by Saul on 2/14/25.
//

//KNOWN ISSUES: pressing done does uipdate the habit but the changes won't be reflect in the DailyHabits's tracker view until you navigate to another view useuing the tab bar and navigate back

import SwiftUI

struct HabitDetailsView: View {
    //@State var percentageProgress: Int?
    @State var progress: Float
    var habitName: String?
    var goal: Int?
    var body: some View {
        VStack{
            
            Text("Almost there!")
                .font(.title)
                .padding(.top, 60)
            
            Text("Keep going, you're doing great!")
                .font(.title3)

            ZStack(){
                Circle()
                    .stroke(Color.blue, lineWidth: 10)
                    .frame(width: 200, height: 200)
                    
                
                Text("\(Int(progress))")
                    .font(.system(size:60))
            }.padding(.vertical, 70)
            
            
            
            Slider(value: $progress, in: 0...Float(goal ?? 5), step: 1)
                .padding(.horizontal, 20)
                .tint(.blue)
            Button{
                HabitDetailsViewModel.habitUpdater.updateHabitProgress(habitName: habitName!, newProgress: Int(progress))
            } label: {
                Text("Done")
                    .frame(width: 200, height: 50)
                    .foregroundColor(.white)
                    .background(.darkGreen)
                    .cornerRadius(15)
                    .padding()
                        
            }
            Spacer()

   
    
        }.navigationTitle(Text("\(habitName ?? "Habit") Details")).navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var progress: Float = 0.5
    NavigationView{
        HabitDetailsView(progress: progress)
    }

}
