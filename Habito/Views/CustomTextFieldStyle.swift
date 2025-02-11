//
//  CustomTextFieldStyle.swift
//  Habito
//
//  Created by Saul on 2/10/25.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color(UIColor.darkGreen), lineWidth: 2)
            }
    }
}

struct CustomTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextField("Text Message", text: .constant(""))
            .textFieldStyle(CustomTextFieldStyle())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
