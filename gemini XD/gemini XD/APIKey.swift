//
//  APIKey.swift
//  gemini XD
//
//  Created by Turma02-18 on 24/09/25.
//

import Foundation

enum APIKey {
    
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist")
        
        else{
            fatalError ("Couldn't find file 'GenerativeAI_Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError ("Couldn't find key API_KEY' in 'GenerativeAI_Info.plist.")
        }
        if value.starts(with: "_"){
            fatalError("Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key")
        }
        return value
    }
}
