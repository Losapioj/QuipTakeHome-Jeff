//
//  PhotoListItemView.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/18/22.
//

import SwiftUI

struct PhotoListItemView: View {
    var photoURL: URL?
    
    var body: some View {
        AsyncImage(url: photoURL) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 120, height: 120, alignment: .center)
    }
}

struct PhotoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListItemView(photoURL: URL(string: "https://en.wikipedia.org/wiki/Bliss_(image)#/media/File:Bliss_(Windows_XP).png")!)
    }
}
