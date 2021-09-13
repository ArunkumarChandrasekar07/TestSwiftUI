//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Arunkumar Chandrasekar on 11/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var dataModal        =   [DataModal]()
    @State var isDataLoading    = true
    @State var selectKeeper = Set<String>()
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: $isDataLoading) {
                List(dataModal, id: \.self, selection: $selectKeeper) { (data) in
                    NavigationLink(destination: InfoView(data: data)) {
                        CardView(image: data.thumbnailUrl, title: data.title)
                    }
                }
                .padding(.top)
                .listStyle(.plain)
            }
            .onAppear {
                UITableView.appearance().separatorColor = .clear
                API().loadData { (dataModal) in
                    isDataLoading   =   false
                    self.dataModal  =   dataModal
                }
            }.navigationTitle("Home Screen")
                .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
