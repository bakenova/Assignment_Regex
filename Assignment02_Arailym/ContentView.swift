//
//  ContentView.swift
//  Assignment02_Arailym
//
//  Created by Арайлым Бакенова on 23.09.2023.
//

import SwiftUI

struct ContentView: View {
    // Create an instance of TextProcessing
    let textProcessor = TextProcessing()
    
    // Example email validation
    let email = "example@email.com"
    var isEmailValid: Bool {
        return textProcessor.validateEmail(email)
    }
    
    // Example extracting phone numbers
    let textWithPhoneNumbers = "My phone numbers are 123-456-7890 and 987.654.3210"
    var extractedPhoneNumbers: [String] {
        return textProcessor.extractPhoneNumbers(from: textWithPhoneNumbers)
    }
    
    // Example extracting URLs
    let textWithURLs = "Visit my website at https://www.example.com and my blog at http://blog.example.com"
    var extractedURLs: [String] {
        return textProcessor.extractURLs(from: textWithURLs)
    }
    
    // Example date validation
    let date = "2023-09-23"
    var isDateValid: Bool {
        return textProcessor.validateDate(date)
    }
    
    // Example strong password validation
    let password = "StrongP@ss123"
    var isPasswordStrong: Bool {
        return textProcessor.isStrongPassword(password)
    }
    
    // Example IPv4 validation
    let ipAddress = "192.168.1.1"
    var isIPv4Valid: Bool {
        return textProcessor.validateIPv4(ipAddress)
    }
    
    // Example removing HTML tags
    let htmlText = "<p>This is <b>bold</b> text.</p>"
    var cleanTextWithoutHTML: String {
        return textProcessor.removeHTMLTags(htmlText)
    }
    
    // Example cleaning text (removing special characters)
    let textWithSpecialChars = "Hello, W@rld!"
    var cleanedText: String {
        return textProcessor.cleanText(textWithSpecialChars)
    }
    
    // Example search and replace
    let originalText = "Replace this with that."
    let searchText = "this"
    let replaceText = "that"
    var replacedText: String {
        return textProcessor.searchAndReplace(originalText, search: searchText, replace: replaceText)
    }
    
    // Example extracting timestamps
    let logText = "Log entry at 2023-09-23 15:30:00"
    var extractedTimestamps: [String] {
        return TextProcessing.extractTimestamps(logText: logText)
    }
    
    // Example credit card validation
    let creditCardNumber = "1234567890123498"
    var isCreditCardValid: Bool {
        return textProcessor.validateCreditCardNumber(creditCardNumber)
    }
    
    // Example CSV parsing
    let csvText = "Name, Age\nJohn, 30\nJane, 25"
    var parsedCSV: [[String]] {
        return textProcessor.parseCSV(csvText)
    }
    
    // Example extracting headers
    let markdownText = "# Header 1\n## Header 2\nRegular text"
    var extractedHeaders: [String] {
        return textProcessor.extractHeaders(text: markdownText)
    }
    
    // Example tokenization
    let textToTokenize = "Hello, world! This is a sentence."
    var tokens: [String] {
        return textProcessor.tokenize(text: textToTokenize)
    }
    
    // Example extracting hashtags and mentions
    let socialMediaText = "Check out #SwiftUI and mention @OpenAI!"
    var extractedTagsAndMentions: (hashtags: [String], mentions: [String]) {
        return TextProcessing.extractHashtagsAndMentions(text: socialMediaText)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15){
                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Email Validation: \(isEmailValid ? "Valid" : "Invalid")")
                    Text("2. Extracted Phone Numbers: \(extractedPhoneNumbers.joined(separator: ", "))")
                    Text("3. Extracted URLs: \(extractedURLs.joined(separator: ", "))")
                    Text("4. Date Validation: \(isDateValid ? "Valid" : "Invalid")")
                    Text("5. Strong Password Validation: \(isPasswordStrong ? "Valid" : "Invalid")")
                    
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("6. IP Validation: \(isIPv4Valid ? "Valid" : "Invalid")")
                    Text("7. Clean Text (without HTML): \(cleanTextWithoutHTML)")
                    Text("8. Cleaned Text (without Special Characters): \(cleanedText)")
                    Text("9. Replaced Text: \(replacedText)")
                    Text("10. Extracted Timestamps: \(extractedTimestamps.joined(separator: ", "))")
                    
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("11. Credit Card Validation: \(isCreditCardValid ? "Valid" : "Invalid")")
                    Text("12. Parsed CSV:")
                    ForEach(0..<parsedCSV.count, id: \.self) { rowIndex in
                        let row = parsedCSV[rowIndex]
                        Text("Row \(rowIndex + 1): \(row.joined(separator: ", "))")
                    }
                    Text("13. Extracted Headers: \(extractedHeaders.joined(separator: ", "))")
                    Text("14. Tokenized Text: \(tokens.joined(separator: ", "))")
                    Text("15. Extracted Hashtags: \(extractedTagsAndMentions.hashtags.joined(separator: ", "))")
                    
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
