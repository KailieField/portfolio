import SwiftUI
import PDFKit

struct BlogWritingView: View {
    let blogWritings = blogWritingExamples
    
    var body: some View {
        NavigationView{
            List{
                ForEach(blogWritings, id: \.category) { writing in
                    Section(header: Text(writing.category)
                        .font(.headline)
                        .foregroundColor(.secondary)){
                            ForEach(writing.examples, id: \.self) { example in
                                if let pdfURL = self.getPDFURL(for: example){
                                    NavigationLink(destination: PDFViewer(url: pdfURL)){
                                        Text(example)
                                            .padding(.vertical, 5)
                                    }
                                } else {
                                    Text(example)
                                        .padding(.vertical, 5)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Academic Writing")
                .listStyle(GroupedListStyle())
            }
        }
        func getPDFURL(for example: String) -> URL? {
            let fileName = example.lowercased().replacingOccurrences(of: " ", with: "-")
            return Bundle.main.url(forResource: fileName, withExtension: "pdf")
        }
    }

#Preview {
    BlogWritingView()
}
