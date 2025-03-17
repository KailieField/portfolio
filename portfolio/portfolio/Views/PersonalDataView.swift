import SwiftUI
import PDFKit

struct PDFViewer: View{
    var url: URL
    
    var body: some View{
        NavigationView{
            PDFKitView(url: url)
                .navigationBarTitle("Cover Letter", displayMode: .inline)
//                .navigationBarItems(leading: Button("Back"){
//                    
//                })
                .edgesIgnoringSafeArea(.all)
        }
    }
//}
struct PDFKitView: UIViewRepresentable{
    var url: URL
    
    func makeUIView(context: Context) -> PDFView{
        let pdfView = PDFView()
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context){
        if let document = PDFDocument(url: url){
            uiView.document = document
        }
    }
}

struct PersonalDataView: View {
    let data = personalInfo
    @State private var showCoverLetterPDF = false
    
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
            
            //---- cover letter button ----
            Button(action: {
                showCoverLetterPDF.toggle() // -- open cover letter PDF
            }) {
                Label("Cover Letter", systemImage: "doc.text")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            .sheet(isPresented: $showCoverLetterPDF){
                if let url = Bundle.main.url(forResource: data.coverLetterFileName, withExtension: "pdf"){
                    PDFViewer(url: url) // -- show PDF when the sheet is presented
                }
            }
            //---- resume button ----
            Button(action: {
                openPDF(named: data.resumeFileName) // -- open resume
            }) {
                Label("Resume", systemImage: "doc.text")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationBarTitle("About Me")
        .padding()
    }
    
    func openPDF(named fileName: String){
        if let url = Bundle.main.url(forResource: fileName, withExtension: "pdf"){
            print("Opening URL: \(url)")
            UIApplication.shared.open(url) // -- open PDF using URL -- externally
        }else{
            print("File not found: \(fileName).pdf")
        }
    }
}

#Preview{
    PersonalDataView()
}
