//
//  ProfileImageView.swift
//  ProfileImageView
//
//  Created by Arunkumar Chandrasekar on 11/09/21.
//

import SwiftUI

struct ProfileImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        Image(uiImage: imageLoader.image ?? UIImage() )
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80, alignment: .center)
            .cornerRadius(40)
            .padding(.all, 10)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(withURL: "")
    }
}
