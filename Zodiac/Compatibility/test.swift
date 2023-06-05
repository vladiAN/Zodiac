import SwiftUI

struct ContentView1: View {
    let title: String
    let text: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(text)
                    .font(.body)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                    .padding()
            )
            .padding(.horizontal)
        }
        .background(Color.gray.opacity(0.1))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1(title: "Заголовок", text: "Это текст в ScrollView.")
    }
}
