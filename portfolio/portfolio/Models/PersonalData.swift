import SwiftUI

struct PersonalData {
    
    let name: String
    let bio: String
    let resumeFileName: String
    let coverLetterFileName: String
    let careerGoal: String
    
    func fileURL(for fileName: String) -> URL? {
        return Bundle.main.url(forResource: fileName, withExtension: "pdf")
    }
}

let personalInfo = PersonalData(
    name: "Kailie Field",
    bio: "Multi-Technologist specializing in emerging tech, research and development.",
    resumeFileName: "resume",
    coverLetterFileName: "cover_letter",
    careerGoal: "To innovate within the Quntum Realm and advance AI research."
    )
