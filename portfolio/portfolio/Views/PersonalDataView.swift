import SwiftUI


struct PersonalDataView: View {
    let data = personalInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(data.name)
                .font(.largeTitle)
                .bold()
            
            Text(data.bio)
                .font(.body)
            
            Text("Career Goal: \(data.careerGoal)")
                .font(.headline)
                .padding(.top, 5)
            
            Divider()
            
            Button(action: {
                openPDF(named: data.resumeFileName)
            }) {
                Label("View Resume", systemImage: "doc.text")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func openPDF(named fileName: String){
        if let url = Bundle.main.url(forResource: fileName, withExtension: "pdf"){
            UIApplication.shared.open(url)
        }else{
            print("File not found: \(fileName).pdf")
        }
    }
}

#Preview{
    PersonalDataView()
}
