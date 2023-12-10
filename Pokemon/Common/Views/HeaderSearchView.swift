//
//  HeaderSearchView.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 8/12/23.
//

import SwiftUI

protocol SearchDelegate {
    func search(query: String)
    var placeHolder: String { get }
}

struct HeaderSearchView: View {
    var delegate: SearchDelegate
    @State private var fieldTextSearch: String = ""
    @State private var isEditing: Bool = false
    @State private var isFocus: Bool = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.black)
                    .padding(.leading, 16)
                    .opacity(0.5)
                
                TextField(delegate.placeHolder, text: $fieldTextSearch)
                    .padding(8)
                    .font(Font.system(size: 15))
                    .foregroundColor(Color.black)
                    .accentColor(Color.black)
                    .onTapGesture {
                        isFocus = true
                        isEditing = true
                    }
                    .onChange(of: fieldTextSearch) { _, _ in
                        delegate.search(query: fieldTextSearch)
                    }
                    .showClearButton($fieldTextSearch)
                
            }
            .background(Color.white)
            .clipShape(Capsule())
            .padding(16)
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    isFocus = false
                    fieldTextSearch = ""
                    hideKeyboard()
                    delegate.search(query: fieldTextSearch)
                }, label: {
                    Text("Cancel")
                })
                .frame(height: 21)
                .padding(.trailing, 15)
                .foregroundColor(.white)
            }
        }
        .background(Color.backgroundColor)
        .onChange(of: fieldTextSearch) { _, _ in
            isEditing = !fieldTextSearch.isEmpty || isFocus
        }
    }
}

