import SwiftUI
import PDFKit

struct BlogWritingView: View {
    let blogWritings = blogWritingExamples
    
    var body: some View {
        NavigationView {
            List(blogWritings, id: \.category){ writing in
                Section(header: Text(writing.category)
                    .font(.headline)
                    .foregroundColor(.black)) {
                ForEach(writing.examples, id: \.self) { example in
                    NavigationLink(destination: PDFViewer(url: self.getPDFURL(for: example))){
                        Text(example)
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
            .navigationTitle("Academic Writing")
            .listStyle(GroupedListStyle())
        }
    }
    
    func getPDFURL(for example: String) -> URL {
        let fileName = example.lowercased().replacingOccurrences(of: " ", with: "-")
        return Bundle.main.url(forResource: fileName, withExtension: "pdf")!
    }
}

#Preview {
    BlogWritingView()
}
