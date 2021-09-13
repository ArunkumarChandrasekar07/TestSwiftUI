//
//  CardView.swift
//  CardView
//
//  Created by Arunkumar Chandrasekar on 11/09/21.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var title: String
    
    @State private var showingActionSheet = false
    
    var body: some View {
        HStack(alignment: .center) {
            ProfileImageView(withURL: image)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .onTapGesture {
                        self.showingActionSheet =   true
                    }
                    .actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(title: Text("Hello There!!"), message: Text(title), buttons: [
                            .default(Text("Default Button")),
                            .destructive(Text("Destructive Button")),
                            .cancel()
                        ])
                    }
            }.padding(.all, 10)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(UIColor.white))
        .modifier(CardModifier())
        .padding(.all, 5)
    }
    
    func showAlert() {
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "", title: "")
    }
}


struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
    
}
