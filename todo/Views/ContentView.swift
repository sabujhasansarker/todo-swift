import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    let fruits = ["Apple", "Banana", "Mango", "Orange"]
    init() {
           for family in UIFont.familyNames {
               for name in UIFont.fontNames(forFamilyName: family) {
                   print("Font Name: \(name)")
               }
           }
       }
       
    var body: some View {
        ScrollView {
            VStack {

                Text("Hello, World!")
                    .font(.largeTitle)
                    .padding()

                TextField("Name", text: .constant(""))
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Enter your name here", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Image(systemName: "plus.circle")
                    .foregroundColor(.yellow)
                    .font(.system(size: 50))

                AsyncImage(url: URL(string: "https://rukminim2.flixcart.com/image/480/640/xif0q/shopsy-cloth-dryer-stand/n/m/v/3-75-steel-floor-cloth-dryer-stand-gopala-original-imahfy9jgnpjggvr.jpeg?q=90")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                } placeholder: {
                    ProgressView()
                }

                Button(action: {
                    print("The star button was clicked!")
                }) {
                    Text("Submit")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }

                // List এর বদলে ForEach — এটা নিজে scroll করবে না, বাইরের ScrollView এর সাথে merge হয়ে যাবে
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                        Divider()
                    }
                }
                .padding(.horizontal)

                HStack(spacing: 100) {
                    Text("Left Item")

                    VStack {
                        Text("Right Top")
                        Text("Right Bottom")
                    }
                }
                .padding()

                Text("Custom Styling")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.9))

                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets.")
                    .font(.custom("Poppins-Bold", size: 16,))
                    .lineSpacing(8)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("This is Edu VIC WANT Hand Font!")
                    .font(.poppins(.bold, size: .largeTitle))
                    .foregroundColor(.brand.primary)
                               .italic()
                               .textCase(.lowercase)
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
