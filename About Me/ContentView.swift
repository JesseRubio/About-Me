//
//  ContentView.swift
//  About Me
//
//  Created by Jesse Rubio on 11/18/20.
//

import SwiftUI
import MessageUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.34, green: 0.50, blue: 0.7355)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image(Constants.PersonalInfo.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                
                Text("Jesse Rubio")
                    .font(.custom("Pacifico-Regular", size: 35))
                    .foregroundColor(Color(hue: 0.604, saturation: 0.616, brightness: 0.409))
                
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .foregroundColor(Color(hue: 0.604, saturation: 0.616, brightness: 0.409))
                
                
                
                Divider()
                    .padding()
                
                Button(action: {   UIApplication.shared.open(Constants.PersonalInfo.phoneNumberDail!)}) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 350, height: 50, alignment: .center)
                        .clipShape(Capsule())
                        .overlay(
                            HStack {
                                Image(systemName: "phone.fill")
                                Text(Constants.PersonalInfo.phoneNumber)
                            }    .foregroundColor(.black)
                        ).padding()
                    
                }
                
                Button(action: {
                    if let url = URL(string: "mailto:\(Constants.PersonalInfo.emailAddress)") {
                    if #available(iOS 10.0, *) {
                      UIApplication.shared.open(url)
                    } else {
                      UIApplication.shared.openURL(url)
                    }
                  }
                }) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 350, height: 50, alignment: .center)
                        .clipShape(Capsule())
                        .overlay(
                            HStack {
                                Image(systemName: "envelope.fill")
                                Text(Constants.PersonalInfo.emailAddress)
                            }    .foregroundColor(.black)
                            
                        )
                }
                Divider()
                    .padding()
                
                
                
                Spacer()
                
                HStack {
                    Button(action: {
                        UIApplication.shared.open(Constants.githubURL!)
                    }) {
                        Image(Constants.github)
                            .renderingMode(.original)
                            .padding(.leading)
                        
                    }
                    
                    Button(action: {
                        UIApplication.shared.open(Constants.instagramURL!)
                    }) {
                        Image(Constants.instagram)
                            .renderingMode(.original)
                        
                    }
                    
                    Button(action: {
                        if(UIApplication.shared.canOpenURL(Constants.faceBookApp! as URL)){
                            // FB installed
                            UIApplication.shared.open(Constants.faceBookApp! as URL, options: [:], completionHandler: nil)
                        } else {
                            // FB is not installed, open in safari
                            UIApplication.shared.open(Constants.faceBookWeb! as URL, options: [:], completionHandler: nil)
                        }
                        //UIApplication.shared.open(Constants.faceBookUrl!)
                    }) {
                        Image(Constants.facebook)
                            .renderingMode(.original)
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
