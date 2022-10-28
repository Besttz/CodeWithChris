//
//  ContentModel.swift
//  M5
//
//  Created by ZhangTommy on 20/10/2022.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData : Data?
    
    // Current lesson description
    @Published var currentLessonDesc = NSAttributedString()
    
    @Published var navPath = NavigationPath()
    
    init() {
        getLocalData()
    }
    // MARK: - Module Navigation Methods
    
    func beginModule(_ moduleID : Int)  {
        for index in 0..<modules.count {
            if modules[index].id == moduleID {
                currentModuleIndex = index
                currentModule = modules[index]
                break
            }
        }
        
    }
    func beginLesson(_ index : Int)  {
        if currentModule != nil && index < currentModule!.content.lessons.count {
            currentLessonIndex = index
        } else {
            currentLessonIndex = 0
        }
        currentLesson =  currentModule!.content.lessons[index]

        currentLessonDesc = addStyling(currentLesson!.explanation)
        
    }

    func haveNextLesson() -> Bool {
        return ((currentLessonIndex + 1) < currentModule!.content.lessons.count)
    }
    
    func goNextLesson()  {
        if haveNextLesson() {
            beginLesson(currentLessonIndex+1)
        }
    }
    
    // MARK: - Data Methods
    func getLocalData() {
        
        // Get a url to local json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        // Read the file
        do {
            // Try to decode the json

            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            self.modules = try jsonDecoder.decode([Module].self, from: jsonData)
        } catch  {
            print(error)
            return
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        // Read the file
        do {
            // Try to decode the style
            self.styleData = try Data(contentsOf: styleUrl!)
            print("Style.html parsed")
        } catch  {
            print(error)
            return
        }

    }
    
    // MARK: - Code Styling
    
    func addStyling(_ html:String) -> NSAttributedString {
        var data = Data()
        // Add Styling
        if let styleData = styleData {
            data.append(styleData)
        }
        // Add HTML
        data.append(Data(html.utf8))
        
        if let result = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            return result
        }
        //Return
        return NSAttributedString()
    }
}
