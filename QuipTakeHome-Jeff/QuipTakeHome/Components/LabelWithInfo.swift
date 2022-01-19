//
//  LabelWithInfo.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/18/22.
//

import SwiftUI

struct LabelWithInfo: View {
    var label: String
    var info: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(info)
        }
    }
}
