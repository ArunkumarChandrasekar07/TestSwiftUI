//
//  InfoView.swift
//  InfoView
//
//  Created by Arunkumar Chandrasekar on 12/09/21.
//

import SwiftUI

struct InfoView: View {
    
    var data: DataModal
    @State var image = UIImage()
    
    var body: some View {
        ScrollView {
            MapView(coordinate: .init(latitude: 11.0168, longitude: 76.9558))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: Image(uiImage: image))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.title)
                    .foregroundColor(.primary)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Detail Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(data: .init(id: 0, albumId: 0, url: "", thumbnailUrl: "", title: ""))
    }
}
