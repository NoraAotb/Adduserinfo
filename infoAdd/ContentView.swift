//
//  ContentView.swift
//  infoAdd
//
//  Created by Norah Abass AlOtaibi on 14/07/1444 AH.
//

import SwiftUI
import CoreLocationUI
import MapKit


struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State private var SchoolName: String = ""
    @State private var Email: String = ""
    @State private var PhoneNumber: String = ""
    @State private var profileText = " bio"
    
    @State var selectedImage: UIImage?
    @State var selectedImage1: UIImage?
    
    
    
    var body: some View {
       
         
            VStack {
                ScrollView{
                    
                    //                    Image ("n")
                    UploadAnImage1()
                    //                    Image(systemName:"person")
                    //                        .resizable()
                    //                        .padding()
                    //                        .frame(width: 100.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    //                        .clipShape(Circle())
                    //                        .overlay(Circle()
                    //                            .stroke(Color.gray, lineWidth: 5))
                    //                        .padding()
                        
                    Text("Account Informationnt")
                        .font(.title)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    
                    Group{
                        HStack {
                            Image(systemName:"bus.fill")
                            TextField("SchoolName", text: $SchoolName)
                        }
                        HStack{
                            Image(systemName:"envelope")
                            TextField("Email", text: $Email)
                            
                        }

                        HStack{
                            Image(systemName:"phone")
                            TextField("PhoneNumber", text: $PhoneNumber)
  
                        }

                        
                    }                        .padding(.horizontal)
                        .foregroundColor(Color("OnyxGray"))
                        .frame(width: 358, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("OnyxGray"), lineWidth: 1))
                        .padding(.bottom, 8)
                        
                        //                    Image(systemName:"pencil")
                    HStack(alignment: .top){
                            Image(systemName:"pencil.and.outline")
                            .padding(.top, 8)
                            TextEditor(text: $profileText)
                                
                        }
                        .padding(.horizontal)
                        .frame(width: 358, height: 72)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("OnyxGray"), lineWidth: 1))
                        .padding(.bottom, 8)
                    
                        
                        //✏️ Title
                            .navigationTitle("Add School")   .font(.system(size: 17, weight: .semibold))
                            .navigationBarTitleDisplayMode(.inline)
//                            .tracking(-0.41)
                          
                        
                        
                        
                    
//                    Divider()
//                        .frame(width: 300, height: 16)
                    Text("Facility")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20, weight: .semibold)).tracking(0.38)
                    // Facility
                    
                    HStack(spacing: 17.0){
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .frame(width: 66, height: 47)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:2)
                            Image(systemName:"bus.fill")
                                .foregroundColor(Color("Sage"))
                            //                        figure.pool.swim
                            
                        }
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .frame(width: 66, height: 47)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:2)
                            Image(systemName:"figure.pool.swim")
                                .foregroundColor(Color("Mandarin"))
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .frame(width: 66, height: 47)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:2)
                            //                        desktopcomputer
                            Image(systemName:"desktopcomputer")
                                .foregroundColor(Color("Sage"))
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .frame(width: 66, height: 47)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:2)
                            Image(systemName:"house")
                                .foregroundColor(Color("Mandarin"))
                        }
                    }
                    //Add Your school Photos:
//                    Text("Add Your school Photos:").font(.system(size: 20, weight:
//                            .semibold)).tracking(0.38)
                    
                       .padding()
                    HStack{
//                        UploadAnImage()
//                       Image("tech")
                        UploadAnImage3()
//                        Image(systemName:"photo.on.rectangle.angled")
//                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height:150)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                            .frame(width: 150, height: 150)
                            .padding()
                    }
                    .padding()
                    //Add Your school location:
                    Text("Add Your school location:").font(.system(size: 20, weight: .semibold)).fontWeight(.medium).tracking(0.38)
                    
                    
                    
                                        ZStack(alignment: .bottom) {
                                                   Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                                                       .edgesIgnoringSafeArea(.all)
                    
                                                   VStack {
                                                       if let location = locationManager.location {
                                                           Text("**Current location:** \(location.latitude), \(location.longitude)")
                                                               .font(.callout)
                                                               .foregroundColor(.white)
                                                               .padding()
                                                               .background(.gray)
                                                               .clipShape(RoundedRectangle(cornerRadius: 10))
                                                       }
                    
                                                       Spacer()
                                                       LocationButton {
                                                           locationManager.requestLocation()
                                                       }
                                                       .cornerRadius(30)
                                                       .symbolVariant(.fill)
                                                       .foregroundColor(.white)
                                        
                                                   }
                    
                                    }     .frame(width: 320, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                }
                
                
                .toolbar {
                    // 1
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button("Save") {}
                    }
                    // 2
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button("Back") {}
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
