//
//  MainView.swift
//  InstargamDeskTop
//
//  Created by Kanz on 2020/12/28.
//

import SwiftUI

struct MainView: View {
    var screen = NSScreen.main!.visibleFrame
    @State var searchText: String = ""
    @State var currentFeedType: String = "Latest"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            
            VStack {
                
                // Seach Area
                SearchAreaView(searchText: $searchText)
                
                Text("Stories")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                // Stories..
                StoriesScrollView()
                
//                HStack(alignment: .top) {
//                    Text("Feed")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                    
//                    Spacer()
//                    
//                    ForEach(["Latest", "Popular"], id: \.self) { type in
//                        Button(action: {
//                            withAnimation { currentFeedType = type }
//                        }, label: {
//                            VStack(spacing: 8) {
//                                Text(type)
//                                    .foregroundColor(currentFeedType == type ? .white : .gray)
//                                
//                                ZStack {
//                                    Circle()
//                                        .fill(Color.clear)
//                                        .frame(width: 5, height: 5)
//                                    
//                                    if currentFeedType == type {
//                                        Circle()
//                                            .fill(Color.white)
//                                            .frame(width: 5, height: 5)
//                                    }
//                                }
//                            }
//                        })
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top, 8)
                
//                // Posts.. 열이 두개
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), content: {
//
//                    // Using Only Post Images
//                    // Not Any Specific Array For this..
//                    ForEach(1...9, id: \.self) { index in
//
//                        // PostCardView
//                        PostCardView(image: "post\(index)")
//                    }
//                })
//                .padding()
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Color("Main"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: - SearchAreaView
struct SearchAreaView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.white.opacity(0.25))
                .cornerRadius(10)
            
            Button(action: {}, label: {
                Label(
                    title: { Text("Add Photos") },
                    icon: { Image(systemName: "plus.square") })
                    .foregroundColor(.white)
                    .padding(10)
                    .background(gradient)
                    .cornerRadius(10)
            })
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .padding(.top, 20)
    }
}

// MARK: - StoriesScrollView
struct StoriesScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true, content: {
            
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 55, height: 55)
                        .background(Color.orange.opacity(0.15))
                        .clipShape(Circle())
                    
                })
                .buttonStyle(PlainButtonStyle())
                
                ForEach(1...32, id: \.self) { index in
                    Image("p\(index % 6 + 1)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .padding(5)
                        .background(Circle().stroke(gradient, lineWidth: 2))
                        .clipShape(Circle())
                }
            }
            .padding()
        })
    }
}
