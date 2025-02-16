//
//  QuickGuideCardDetailView.swift
//  Habito
//
//  Created by Saul on 2/16/25.
//

import SwiftUI

struct QuickGuideCardDetailView: View {
    var title: String?
    var text: String?
    var image: UIImage?
    var body: some View {
        ScrollView{
            Image(uiImage: image ?? UIImage(named: "sleeping1.jpg")!)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 190)
                .cornerRadius(15)
                .shadow(radius: 3)
                .opacity(0.8)
                .padding(.top)
            Text(title ?? "Why a Good Night's Sleep is the Foundation of Good Health")
                .frame(width: .infinity, alignment: .leading)
                .frame(height: 100)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .font(.title3)
            Text(text ?? "A good night's sleep is often regarded as one of the cornerstones of overall health and well-being. It’s not just about waking up feeling rested, but sleep plays a crucial role in almost every aspect of our physical, mental, and emotional health. \n\nWhen it comes to physical health, sleep is vital for the restoration and recovery of the body. During sleep, the body has a chance to repair cells, regenerate tissues, and boost immune function. Growth hormone, which helps with tissue repair and muscle growth, is primarily released during deep sleep. Furthermore, sleep is essential for heart health. Chronic sleep deprivation has been linked to an increased risk of heart disease, high blood pressure, and stroke. Quality sleep helps regulate stress hormones, reduce inflammation, and lower blood pressure, all of which contribute to better cardiovascular health. Additionally, sleep plays a role in metabolism and weight management by regulating hunger hormones like ghrelin and leptin. Poor sleep can disrupt these hormones, leading to increased cravings and overeating, which can result in weight gain.\n\nSleep is also critical for mental and cognitive function. During sleep, the brain processes and stores information from the day, which is essential for learning and memory consolidation. This is why a good night's sleep before a test or presentation can improve performance. Sleep also helps with concentration, decision-making, and problem-solving. When you're well-rested, your cognitive functions are sharper, and you're better equipped to focus and make decisions. Beyond cognitive abilities, sleep has a significant impact on mood and mental health. Lack of sleep can lead to irritability, anxiety, and heightened stress. Long-term sleep deprivation is linked to mental health issues like depression and anxiety. On the flip side, sleep helps the brain manage emotions and regulate stress, improving overall emotional stability.\n\nIn terms of immune function, sleep plays an important role in strengthening the body’s defenses. During sleep, the body produces cytokines, which are proteins that help fight infections, inflammation, and stress. Without enough sleep, the production of these immune markers decreases, making the body more susceptible to illness. People who sleep poorly are more likely to get sick after being exposed to a virus, such as the common cold. On the other hand, getting sufficient sleep helps the immune system function optimally.\n\nGood sleep is also linked to longevity. People who consistently get enough sleep tend to live longer and enjoy a higher quality of life. Sleep supports the body’s repair processes, reduces stress, and improves overall health, all of which contribute to a longer, healthier life.\nFinally, sleep plays a significant role in emotional and social well-being. When you're well-rested, you're better able to engage with others, which helps in forming and maintaining healthy relationships. A lack of sleep can lead to emotional instability, making it harder to interact with others in a positive and meaningful way. In short, a good night’s sleep is essential for good health, both physically and emotionally.")
                .foregroundColor(.black)
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    QuickGuideCardDetailView()
}
