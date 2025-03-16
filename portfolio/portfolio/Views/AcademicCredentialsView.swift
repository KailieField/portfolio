import SwiftUI

struct AcademicCredentialsView: View {
    
    let credentials = academicCredentials
    
    var body: some View {
        List(credentials, id: \.diploma){
            credential in VStack(alignment: .leading){
                Text(credential.diploma)
                    .font(.headline)
                    .padding(.bottom, 2)
                Text(credential.institution)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 2)
                Text("Year: \(credential.year)")
                    .font(.body)
                    .padding(.bottom, 2)
                if !credential.awards.isEmpty {
                    Text("Awards: \(credential.awards)")
                        .font(.body)
                        .italic()
                        .foregroundColor(.black)
                }
            }
            
            .padding()
        }
        .navigationTitle("Academic Credentials")
    }
}

struct AcademicCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        AcademicCredentialsView()
    }
}
