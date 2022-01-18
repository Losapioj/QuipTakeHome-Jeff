//
//  DayImagesView.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI

struct DayImagesView: View {
    @StateObject var viewModel: DayImagesViewModel
    
    var body: some View {
        ScrollView {
            
        }
        .alert(isPresented: $viewModel.alert.isNullBinding()) {
            viewModel.alert ?? Alert(title: Text(""))
        }
    }
}

struct DayImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DayImagesView(viewModel: DayImagesViewModel(selectedDate: Date()))
    }
}
