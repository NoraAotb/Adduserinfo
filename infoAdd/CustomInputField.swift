//
//  CustomInputField.swift
//  Ivy
//
//  Created by Alaa Alabdullah on 08/12/2022.
//

import SwiftUI

struct CustomInputField: View {
    let placeholderText: String
    @Binding var text: String
    var body: some View {
        VStack{
            TextField(placeholderText, text: $text)
                .padding([.top, .bottom],10)
                .padding([.leading, .trailing])

                
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(placeholderText: "Email", text: .constant(""))
    }
}
