//
//  CreateNewHabit.swift
//  Habito
//
//  Created by squiggly on 2/14/25.
//

import SwiftUI

struct CreateNewHabit: View {
    @Binding var showPlusView: Bool
    @State private var selectedActivity: String? = nil
    @State private var selectedTime: String? = nil
    @State private var habitTitle: String = ""
    @State private var habitDetails: String = ""
    var body: some View {
        VStack{
            
            ZStack{
                Rectangle()
                    .foregroundColor(.darkGreen.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .cornerRadius(20)
                    .shadow(radius: 3)
                VStack{
                    Spacer()
                    HStack{
                        Text("Create New Habit")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.leading, 25)
                        Button(action: {
                            withAnimation {
                                showPlusView.toggle()
                            }
                        }){
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }   .padding(.horizontal, 25)
                        .padding(.top, 70)


                    TextField("Habit Title", text: $habitTitle)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 25)
                        .padding(.top, 20)
                    
                    TextField("Enter your habit details", text: $habitDetails, axis: .vertical)
                        .frame(maxWidth: .infinity)
                        .frame(height:  100)
                        .padding(.horizontal, 25)
                    Spacer()
                }

                
            }.padding(.top, -100)
            
            Text("Choose an Activity")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 25)
                .padding(.top, 15)
            HStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(selectedActivity == "Running" ? .darkGreen : .gray)
                        .frame(width: 65, height: 70)
                        .shadow(radius: 3)
                    VStack{
                        Image(systemName: "figure.run")
                            .foregroundColor(.grayishWhite)
                            .font(.title)

                    }
                
                }.padding(.leading, -20)
                    .onTapGesture {
                        selectedActivity = "Running"
                    }
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(selectedActivity == "Drinking" ? .darkGreen : .gray)
                        .frame(width: 65, height: 70)
                        .shadow(radius: 3)
                    VStack{
                        Image(systemName: "drop.fill")
                            .foregroundColor(.grayishWhite)
                            .font(.title)
                        
                    }
                
                }.onTapGesture {
                    selectedActivity = "Drinking"
                }
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(selectedActivity == "Sleeping" ? .darkGreen : .gray)
                        .frame(width: 65, height: 70)
                        .shadow(radius: 3)
                    VStack{
                        Image(systemName: "moon.zzz.fill")
                            .foregroundColor(.grayishWhite)
                            .font(.title)
                        
                    }
                
                }.onTapGesture {
                    selectedActivity = "Sleeping"
                }
                
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(selectedActivity == "Walking" ? .darkGreen : .gray)
                        .frame(width: 65, height: 70)
                        .shadow(radius: 3)
                    VStack{
                        Image(systemName: "figure.walk")
                            .foregroundColor(.grayishWhite)
                            .font(.title)
                        
                    }
                
                }.padding(.trailing, -20)
                    .onTapGesture {
                        selectedActivity = "Walking"
                    }
                Spacer()

                
            }.padding()
            
            Text("Choose Time of Day")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 25)
                .padding(.bottom, 15)
            Spacer()
            
            VStack{
                
                HStack{
                    Spacer()
                    Button{
                        selectedTime = "Morning"
                    } label: {
                        Text("Morning")
                            .frame(width: 170, height: 50)
                            .foregroundColor(selectedTime == "Morning" ? .grayishWhite: .black)
                            .background(selectedTime == "Morning" ? .darkGreen : .grayishWhite)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                            .padding(.trailing, 10)
                            
                    }
                   
                    Button{
                        selectedTime = "Afternoon"
                    } label: {
                        Text("Afternoon")
                            .frame(width: 170, height: 50)
                            .foregroundColor(selectedTime == "Afternoon" ? .grayishWhite: .black)
                            .background(selectedTime == "Afternoon" ? .darkGreen : .grayishWhite)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                          
                    }
                    Spacer()
                    
                }.padding(.bottom, 10)
                HStack{
                    Spacer()
                    Button{
                        selectedTime = "Evening"
                    } label: {
                        Text("Evening")
                            .frame(width: 170, height: 50)
                            .foregroundColor(selectedTime == "Evening" ? .grayishWhite: .black)
                            .background(selectedTime == "Evening" ? .darkGreen : .grayishWhite)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                            .padding(.trailing, 10)
                    }
                    
                    Button{
                        selectedTime = "Night"
                    } label: {
                        Text("Night")
                            .frame(width: 170, height: 50)
                            .foregroundColor(selectedTime == "Night" ? .grayishWhite: .black)
                            .background(selectedTime == "Night" ? .darkGreen : .grayishWhite)
                            .cornerRadius(15)
                            .shadow(radius: 3)

                    }
                    Spacer()
                }.padding(.bottom, 10)
                HStack{
                    Spacer()
                    Button{
                        selectedTime = "Anytime"
                    } label: {
                        Text("Anytime")
                            .frame(width: 170, height: 50)
                            .foregroundColor(selectedTime == "Anytime" ? .grayishWhite: .black)
                            .background(selectedTime == "Anytime" ? .darkGreen : .grayishWhite)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                            
                    }
                    Spacer()
                }
            }.padding(.bottom, 50)
            

            
            Spacer()
            Button{
                //function call here?
                print("trying to add habit")
                let habitCreator = CreateHabitViewModel()
                //10 is just a random default
                habitCreator.addHabitToCurrentAccount(name: habitTitle,type: selectedActivity!)
                withAnimation {
                    showPlusView.toggle()
                }
            }label:{
                Text("Create")
                    .font(.title2)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.grayishWhite)
                    .background(.darkGreen)
                    .cornerRadius(15)
                    .padding(20)
                
            }.shadow(radius: 3)
        }.navigationTitle(Text("Create New Habit")).navigationBarTitleDisplayMode(.inline)
        
        
    }
}

#Preview {
    @Previewable @State var showPlusView: Bool = true
    CreateNewHabit(showPlusView: $showPlusView)
    }
   
