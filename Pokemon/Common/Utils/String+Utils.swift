//
//  String+Utils.swift
//  Pokemon
//
//  Created by Juan Delgado Lasso on 8/12/23.
//

import Foundation

extension String {
    
    static let empty = ""
    
    func loadJson() -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: self, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
