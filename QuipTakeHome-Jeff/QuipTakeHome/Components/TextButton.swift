//
//  TextButton.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI
import Combine

struct TextButton: View {
    var title: String
    @Binding var isEnabled: Bool
    var onClick: () -> Void
    
    private var buttonTextColor: Color {
        isEnabled ? Color.buttonTextEnabled : Color.buttonTextDisabled
    }
    
    private var buttonBackgroundColor: Color {
        isEnabled ? Color.buttonBackgroundEnabled : Color.buttonBackgroundDisabled
    }
    
    init(
        title: String,
        isEnabled: Binding<Bool> = .constant(true),
        onClick: @escaping () -> Void
    ) {
        self.title = title
        _isEnabled = isEnabled
        self.onClick = onClick
    }
    
    var body: some View {
        Button(action: onClick) {
            Text(title)
                .padding(.all)
        }
        .foregroundColor(buttonTextColor)
        .background(buttonBackgroundColor)
        .cornerRadius(Constants.buttonCornerRadius)
        .disabled(!isEnabled)
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(title: "Test") {}
    }
}
