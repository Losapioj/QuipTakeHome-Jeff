//
//  ImageDetailsView.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI

struct ImageDetailsView: View {
    @StateObject var viewModel: ImageDetailsViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ImageDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailsView(viewModel: ImageDetailsViewModel())
    }
}
