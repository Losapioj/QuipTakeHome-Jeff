//
//  PhotoListView.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/18/22.
//

import SwiftUI
import Combine

struct PhotoListView: View {
    @Binding var photoList: [Photo]
    var onClick: (_ photoClicked: Photo) -> Void
    
    var body: some View {
        ForEach(photoList, id: \.id) { photo in
            PhotoListItemView(photoURL: URL(string: photo.imageURL))
                .onTapGesture { onClick(photo) }
        }
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static let mockPhotoArray: [Photo] = [
        Photo.mock, Photo.mock, Photo.mock, Photo.mock
    ]
    
    static var previews: some View {
        PhotoListView(photoList: .constant(mockPhotoArray)) {photoTapped in }
    }
}
