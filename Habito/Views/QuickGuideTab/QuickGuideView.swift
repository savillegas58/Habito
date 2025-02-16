//
//  QuickGuideView.swift
//  Habito
//
//  Created by Saul on 2/16/25.
//

import SwiftUI

struct QuickGuideView: View {
    var body: some View {
            ScrollView{
                QuickGuideCard()
                //Don't mind this temporary text
                QuickGuideCard(title: "The Power of Daily Exercise: A Boost for Your Body and Mind",text: "Daily exercise holds immense power when it comes to improving both physical and mental well-being. It's not just about building muscle or losing weight; regular physical activity has a profound impact on various aspects of your life, from enhancing your mood to improving long-term health.\n\nOn a physical level, daily exercise strengthens the heart and improves circulation, which in turn helps reduce the risk of chronic conditions such as heart disease, diabetes, and high blood pressure. By incorporating different types of exercise into your routine—whether it’s cardio, strength training, or flexibility exercises—you can improve your overall fitness, increase endurance, and boost energy levels. Exercise is also essential for maintaining a healthy weight. It helps regulate metabolism, burns calories, and builds lean muscle mass, all of which contribute to weight management. Furthermore, exercise improves bone density, which helps prevent osteoporosis and reduces the risk of fractures as you age.\n\nMentally, the benefits of daily exercise are just as significant. Physical activity stimulates the release of endorphins, the body’s natural feel-good hormones. These chemicals can help alleviate stress, reduce anxiety, and boost your mood. Regular exercise has been linked to a lower risk of developing mental health conditions such as depression, anxiety, and even cognitive decline. It’s not just about the immediate rush of feel-good hormones; exercise also helps improve sleep patterns, which in turn enhances mental clarity, focus, and memory. Getting your body moving on a daily basis helps regulate the circadian rhythm, promoting better sleep, which is crucial for both mental and physical health.", image: UIImage(named: "running.jpg")!)
                
                QuickGuideCard(title: "Why You Should Never Forget To Drink A Healthy Amount of Water", text: "Water is essential to life, yet many people often forget to drink an adequate amount throughout the day. Proper hydration is one of the most important aspects of maintaining overall health. From supporting physical performance to improving mental clarity, water plays a vital role in the body’s functions. \n\nOne of the most crucial reasons to drink enough water is to maintain bodily functions. Water is required for digestion, nutrient absorption, and the elimination of waste. It helps regulate body temperature, lubricates joints, and cushions organs and joints. When you're dehydrated, these functions can be impaired, leading to discomfort and, over time, more serious health issues. \n\nDrinking sufficient water also plays a major role in energy levels. Dehydration can lead to fatigue, sluggishness, and decreased stamina. When the body is properly hydrated, the blood flows more easily, delivering oxygen and nutrients to muscles and organs, which helps improve energy and reduce feelings of exhaustion. \n\nIn addition, staying hydrated is essential for skin health. Water helps keep the skin hydrated, giving it a healthy, glowing appearance. When you don't drink enough water, your skin can become dry, dull, and more prone to wrinkles. Proper hydration supports the skin’s elasticity and promotes a youthful look. \n\nWater also helps with weight management. Sometimes, thirst is mistaken for hunger, leading to overeating. Drinking water before meals can make you feel fuller, which may help you consume fewer calories. Furthermore, water supports the metabolism, assisting in the efficient burning of calories and fat.", image: UIImage(named: "water.jpg"))


            }.navigationTitle(Text("Your Mini Guide to Wellness")).navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    NavigationView{
        QuickGuideView()
    }
}
