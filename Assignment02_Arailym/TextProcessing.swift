//
//  TextProcessing.swift
//  Assignment02_Arailym
//
//  Created by Арайлым Бакенова on 23.09.2023.
//

import Foundation

struct TextProcessing {
    
    //2.1
    func validateEmail(_ email: String) -> Bool {
        let pattern = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: email)
    }
    
    //2.2
    func extractPhoneNumbers(from text: String) -> [String] {
        let pattern = #"\b\d{3}[-.\s]?\d{3}[-.\s]?\d{4}\b"#
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch {
            print("Error in regex: \(error)")
            return []
        }
    }
    
    //2.3
    func extractURLs(from text: String) -> [String] {
        let pattern = #"https?://\S+"#
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch {
            print("Error in regex: \(error)")
            return []
        }
    }
    
    //2.4
    func validateDate(_ date: String) -> Bool {
        let pattern = #"^\d{4}-\d{2}-\d{2}$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: date)
    }
    
    //2.5
    func isStrongPassword(_ password: String) -> Bool {
        let pattern = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=])[A-Za-z\d@#$%^&+=]{8,}$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password)
    }
    
    //2.6
    func validateIPv4(_ ip: String) -> Bool {
        let pattern = #"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: ip)
    }
    
    //2.7
    func removeHTMLTags(_ html: String) -> String {
        let pattern = #"<[^>]+>"#
        return html.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }
    
    //2.8
    func cleanText(_ text: String) -> String {
        let pattern = #"[^a-zA-Z0-9\s]"#
        return text.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }
    
    //2.9
    func searchAndReplace(_ text: String, search: String, replace: String) -> String {
        return text.replacingOccurrences(of: search, with: replace, options: .regularExpression)
    }
    
    //2.10
    static func extractTimestamps(logText: String) -> [String] {
        let pattern = #"(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})"#
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let results = regex.matches(in: logText, range: NSRange(logText.startIndex..., in: logText))
            return results.map {
                String(logText[Range($0.range, in: logText)!])
            }
        } catch {
            print("Error in regex: \(error)")
            return []
        }
    }
    
    //2.11
    func validateCreditCardNumber(_ cardNumber: String) -> Bool {
            // Assuming a simple validation for demonstration (16 digits and digits only)
            let pattern = #"^\d{16}$"#
            return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: cardNumber)
        }
    
    //2.12
    func parseCSV(_ csvText: String) -> [[String]] {
            var rows: [[String]] = []
            let lines = csvText.components(separatedBy: "\n")
            
            for line in lines {
                let fields = line.components(separatedBy: ",")
                rows.append(fields)
            }
            
            return rows
    }
    
    //2.13
    func extractHeaders(text: String) -> [String] {
            var headers: [String] = []
            let lines = text.components(separatedBy: "\n")
            
            for line in lines {
                if line.hasPrefix("#") {
                    let header = line.trimmingCharacters(in: .whitespacesAndNewlines)
                    headers.append(header)
                }
            }
            
            return headers
    }
    
    //2.14
    func tokenize(text: String) -> [String] {
        let pattern = #"[\w']+|[.,!?;]"#
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch {
            print("Error in regex: \(error)")
            return []
        }
    }
    
    //2.15
    static func extractHashtagsAndMentions(text: String) -> (hashtags: [String], mentions: [String]) {
        let hashtagPattern = #"\#\w+"#
        let mentionPattern = #"\@\w+"#
        
        let hashtags = extractMatches(pattern: hashtagPattern, text: text)
        let mentions = extractMatches(pattern: mentionPattern, text: text)
        
        return (hashtags, mentions)
    }
    
    private static func extractMatches(pattern: String, text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch {
            print("Error in regex: \(error)")
            return []
        }
    }
}
