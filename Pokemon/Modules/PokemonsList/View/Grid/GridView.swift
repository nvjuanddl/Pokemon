//
//  GridView.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 8/12/23.
//

import SwiftUI

protocol GridViewDelegate: SearchDelegate {
    var hasSearch: Bool { get }
    func more()
    func hasNext() -> Bool
}

struct GridView<Content>: View where Content: View {
    var delegate: GridViewDelegate?
    let content: () -> Content
        
    private let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    init(delegate: GridViewDelegate? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.delegate = delegate
        self.content = content
    }
    
    private func waiting() -> some View {
        VStack(alignment: .center) {
            ActivityIndicator(size: 55, color: .red, velocity: 7.0)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func gridView() -> some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    self.content()
                }
                .padding([.horizontal, .bottom])
                
                if let hasNext = delegate?.hasNext(), hasNext, let hasSearch = delegate?.hasSearch, !hasSearch {
                    ActivityIndicator(size: 45, color: .yellow)
                }
            }
        }
        .padding(.top)
    }
    
    var body: some View {
        VStack {
            HeaderSearchView(delegate: self)
            gridView()
        }
        .background(.white)
    }
}

extension GridView: SearchDelegate {
    
    var placeHolder: String {
        self.delegate?.placeHolder ?? "Find your favorite"
    }
    
    func search(query: String) {
        self.delegate?.search(query: query)
    }
}
