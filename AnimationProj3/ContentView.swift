//
//  ContentView.swift
//  AnimationProj3
//
//  Created by Parshkova Daria on 08.06.2021.
//

import SwiftUI


struct ContentView: View {
    @State var index = 0
    var body: some View {
        
        GeometryReader { _ in
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 70, height: 30)
                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                    
                }
                HStack(spacing:15) {
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) ))
                        .frame(height:1)
                    Text("OR")
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) ))
                        .frame(height:1)
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                HStack(spacing:25) {
                    Button(action : {
                        //
                    }) {
                        Image("insta")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action : {
                        //
                    }) {
                        Image("fb")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action : {
                        //
                    }) {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                }
            }
            .padding(.vertical)
            .offset(y: -170)
            
            
        }
        .offset(y:250)
        .background(Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
    }
}


struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y:100))
            path.addLine(to: CGPoint(x:rect.width, y:rect.height))
            path.addLine(to: CGPoint(x:0,y:rect.height))
            path.addLine(to: CGPoint(x:0, y:0))
        }
        
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y:100))
            path.addLine(to: CGPoint(x:0 , y:rect.height))
            path.addLine(to: CGPoint(x:rect.width ,y:rect.height))
            path.addLine(to: CGPoint(x:rect.width, y:0))
        }
        
    }
}

struct Login : View {
    
    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    var body : some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack(spacing:15) {
                    VStack(spacing:10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                    Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                        
                    }
                    Spacer()
                    
                } .padding(.top, 50)
                VStack {
                    HStack {
                        Image(systemName: "envelop.fill")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        TextField("Email Adress", text:self.$email)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                } .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    HStack(spacing:15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                            TextField("Email Adress", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    HStack {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        SecureField("Password", text:self.$email)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                } .padding(.horizontal)
                .padding(.top, 30)
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        //
                    }) {
                        Text("Forget password")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            } .padding()
                .padding(.bottom, 40)
            .background(Color.init(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius:5 , x:0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal)
            .offset(y: 10)
            Button(action :{
                //
            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 5, y: 5)
                
            }
            .offset(y:15)
            .opacity(self.index == 0 ? 1 : 0)
        }
 
        
    }
    
}


struct SignUp : View {
    @State var email = ""
    @State var pass = ""
    @State var Repass = ""
    @Binding var index : Int
    
    var body : some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    VStack(spacing:10) {
                        Text("Sign up")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                }
                .padding(.top)
                
                VStack {
                    
                    HStack(spacing:15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                        SecureField("Password", text:self.$pass)
                        
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                } .padding(.horizontal)
                .padding(.top, 30)
                VStack {
                    HStack(spacing:15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                        SecureField("Password", text:self.$Repass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                } .padding(.horizontal)
                .padding(.top, 50)
            } .padding()
            .padding(.bottom,100)
            .background(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            
            Button(action: {
                //
            }) {
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1) , radius:5, x:0 , y: -5)
            }
            .offset(y:40)
            .opacity(self.index == 1 ? 1 : 0)
        }
        .offset(y: 50)
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
