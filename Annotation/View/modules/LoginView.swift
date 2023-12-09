////
////  LoginView.swift
////  dwf-ios
////
////  Created by Chhay Sotheara on 2/2/23.
////
//
//import SwiftUI
//
//struct LoginView: View {
//    
//    @EnvironmentObject var loginData : LoginData
//    @State var color    = Color.gray.opacity(0.2)
//    @State var email    = ""
//    @State var password = ""
//    
//    // Login with static email and password
//    @State var emails    = "Hello@gmail.com"
//    @State var passwords = "hello"
//    var urls = "https://icseindia.org/document/sample.pdf"
//    let appColors = AppColors.shared
//    let appSpacing = AppSpacing.shared
//    
//    var body: some View {
//        if loginData.isLogin {
//            ContentView(urls: urls).onOpenURL(perform: {urls in
//                let fixedUrlString = String("\(urls)").replacingOccurrences(of: "https", with: "https:")
//                print(fixedUrlString)
//                let cleanedUrlString = fixedUrlString.replacingOccurrences(of: "mptc://", with: "")
//                print(cleanedUrlString)
////                self.urls = cleanedUrlString
//                print("this is url \(urls)")
////                print("this is url \(urls.scheme)")
//            })
//        }else {
//            if UserDefaults.standard.bool(forKey: "login") == true {
//                ContentView(urls: urls).onOpenURL(perform: {urls in
//                    let fixedUrlString = String("\(urls)").replacingOccurrences(of: "https", with: "https:")
//                    print(fixedUrlString)
//                    let cleanedUrlString = fixedUrlString.replacingOccurrences(of: "mptc://", with: "")
//                    print(cleanedUrlString)
////                    self.urls = cleanedUrlString
//                    print("this is url \(urls)")
////                    print("this is url \(urls.scheme)")
//                })
//            }else{
//                ZStack {
//                    Color("viewBackgroundColor").edgesIgnoringSafeArea(.all)
//                    VStack {
//                        Image("Logo")
//                            .frame(width: 85, height: 85)
//                            .padding(0)
//                        VStack {
//                            Text("កម្មវិធីគ្រប់គ្រង់ឯកសារនិងការអនុម័ត")
//                            Text("តាមប្រព័ន្ធអេឡិកត្រូនិច")
//                        }
//                        .font(.custom("KhmerMPTC-Bold", size: 18))
//                        .fontWeight(.ultraLight)
//                        .padding(.top , 15)
//                        .foregroundColor(appColors.orangeColor)
//                        .frame(width: 300)
//                        .multilineTextAlignment(.center)
//                        
//                        FloatingLabelTextField(placeholder: "សារអេឡិចត្រូនិច", text: self.$email)
//                            .padding()
//                            .background(RoundedRectangle(cornerRadius: 6).stroke(self.email != "" ? Color(.gray) : self.color))
//                            .frame(width: 460, height: 55)
//                            .padding(.top, 25)
//                        
//                        PasswordLabelTextField(placeholder: "លេខសម្ងាត់", text: self.$password)
//                            .padding()
//                            .background(RoundedRectangle(cornerRadius: 6).stroke(self.password != "" ? Color(.gray) : self.color))
//                            .frame(width: 460, height: 55)
//                            .padding(.top, 20)
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                            }){
//                                Text("ភ្លេចលេខសម្ងាត់")
//                                    .foregroundColor(appColors.orangeColor)
//                            }
//                        }
//                        .frame(width: 460)
//                        .padding(.top, 11)
//                        Button(action: {
//                            
//                            if email == emails && password == passwords{
//                                loginData.isLogin = true
//                            }else{
//                                loginData.isLogin = false
//                            }
//                        }){
//                            Text("ចូល")
//                                .foregroundColor(.white)
//                                .frame(width: 460, height: 55)
//                        }
//                        .background(appColors.orangeColor)
//                        .cornerRadius(6)
//                    }
//                    .padding(35)
//                    .background(.white)
//                    .cornerRadius(6)
//                    .shadow(radius: 6)
//                }
//            }
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
//
//
//struct FloatingLabelTextField: View {
//    let placeholder: String
//    @Binding var text: String
//    
//    var body: some View {
//        ZStack (alignment: .leading) {
//            Text(placeholder)
//                .foregroundColor(.black.opacity(0.5))
//                .offset(y: self.text.isEmpty ? 0  : -25)
//                .scaleEffect(self.text.isEmpty ? 1 : 0.9, anchor: .leading)
//                .font(.system(size: self.text.isEmpty ? 18 : 14))
//            
//            
//            TextField("", text: self.$text)
//                .fontWeight(.medium)
//                .foregroundColor(.black)
//        }
//        .padding(.top, self.text.isEmpty ? 0 : 18)
//        .animation(.default, value: !text.isEmpty)
//    }
//}
//struct PasswordLabelTextField: View {
//    let placeholder: String
//    @Binding var text: String
//    
//    var body: some View {
//        ZStack (alignment: .leading) {
//            Text(placeholder)
//                .foregroundColor(.black.opacity(0.5))
//                .offset(y: self.text.isEmpty ? 0  : -25)
//                .scaleEffect(self.text.isEmpty ? 1 : 0.9, anchor: .leading)
//                .font(.system(size: self.text.isEmpty ? 18 : 14))
//            
//            SecureField("", text: self.$text)
//                .fontWeight(.medium)
//                .foregroundColor(.black)
//        }
//        .padding(.top, self.text.isEmpty ? 0 : 18)
//        .animation(.default, value: !text.isEmpty)
//    }
//}
//
