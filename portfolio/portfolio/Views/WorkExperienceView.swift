import SwiftUI

struct WorkExperienceView: View {
    
    let experience = workExperience
    
    var body: some View {
        
        List(experience, id: \.jobTitle) { job in
            
            VStack(alignment: .leading){
                Text(job.jobTitle)
                    .font(.headline)
                    .padding(.bottom, 2)
                Text(job.company)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 2)
                Text("From \(job.startDate) to \(job.endDate)")
                    .font(.body)
                    .padding(.bottom, 2)
            }
            
            .padding()
        }
        
        .navigationTitle("Work History")
    }
}

struct WorkExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        WorkExperienceView()
    }
}
