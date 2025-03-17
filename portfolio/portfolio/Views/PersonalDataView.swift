import SwiftUI
import PDFKit


// ---- PDFViewer: Showing the PDF content
struct PDFViewer: View{
    var url: URL
    
    var body: some View{
            PDFKitView(url: url) // --- rendering PDFKitView
                .navigationBarTitle("Cover Letter", displayMode: .inline) // --- sheet title
                .edgesIgnoringSafeArea(.all)
        }
    }

// --- PDFKitView: managing the PDF for display
struct PDFKitView: UIViewRepresentable{
    var url: URL
    
    func makeUIView(context: Context) -> PDFView{
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displaysPageBreaks = false
        pdfView.displayDirection = .vertical
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context){
        if let document = PDFDocument(url: url){
            uiView.document = document // -- load PDF documents
            DispatchQueue.main.async{
                uiView.goToFirstPage(nil)
            }
        }
    }
}

struct PersonalDataView: View {
    let data = personalInfo
    @State private var showCoverLetterPDF = false
    @State private var showResumePDF = false
    
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
            NavigationLink(destination: PDFViewer(url: Bundle.main.url(forResource: data.coverLetterFileName, withExtension: "pdf")!)
            ){
                Label("Cover Letter", systemImage: "doc.text")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom)

            //---- resume button ----
            NavigationLink(destination: PDFViewer(url: Bundle.main.url(forResource: data.resumeFileName, withExtension: "pdf")!)
             ){
                Label("Resume", systemImage: "doc.text")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationBarTitle("Portfolio")
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
