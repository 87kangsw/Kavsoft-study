//
//  Home .swift
//  PinterestMacApp (iOS)
//
//  Created by Kanz on 2020/12/09.
//

import SwiftUI
import SDWebImageSwiftUI


struct Home: View {
    // Getting Window
    var window = NSScreen.main?.visibleFrame
    
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 4)
    
    @StateObject var imageViewModel = ImageViewModel()
    
    var body: some View {
        HStack {
            
            SideBar()
            
            VStack {
                
                // Top Search Area
                TopSearchAreaView()
                
                // ScrollView with Images..
                GeometryReader { reader in
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 15, content: {
                            
                            // Getting Images..
                            ForEach(imageViewModel.images.indices, id: \.self) { index in
                                
                                ZStack {
                                    WebImage(url: URL(string: imageViewModel.images[index].downLoadURL)!)
                                        .placeholder(content: {
                                            ProgressView()
                                        })
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: (reader.frame(in: .global).width - 45) / 4, height: 150)
                                        .cornerRadius(15)
                                    
                                    Color.black.opacity(imageViewModel.images[index].onHover ?? false ? 0.2 : 0)
                                    
                                    VStack {
                                        HStack {
                                            Spacer(minLength: 0)
                                            
                                            Button(action: {}, label: {
                                                Image(systemName: "hand.thumbsup.fill")
                                                    .foregroundColor(.yellow)
                                                    .padding(8)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                            })
                                            .buttonStyle(PlainButtonStyle())
                                            
                                            Button(action: {
                                                saveImage(index: index)
                                            }, label: {
                                                Image(systemName: "folder.fill")
                                                    .foregroundColor(.blue)
                                                    .padding(8)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                            })
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                        .padding(10)
                                        Spacer()
                                    }
                                    .opacity(imageViewModel.images[index].onHover ?? false ? 1: 0)
                                    
                                    // Hover
                                    .onHover(perform: { hovering in
                                        withAnimation {
                                            imageViewModel.images[index].onHover = hovering
                                        }
                                    })
                                }
                            }
                        })
                        .padding(.vertical)
                    }
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: window!.width / 1.5,
               height: window!.height - 40.0)
        .background(Color.white.opacity(0.6))
        .background(BlurWindow())
    }
    
    // MARK: - Save Image
    func saveImage(index: Int) {
        
        // getting image data from url..
        let manager = SDWebImageDownloader(config: .default)
        manager.downloadImage(with: URL(string: imageViewModel.images[index].downLoadURL)!) { (image, _, _, _) in
            guard let imageOrignal = image else { return }
            
            let data = imageOrignal.sd_imageData(as: .JPEG)
            
            // Saving Image.. (File Access Type -> read/write)
            let pannel = NSSavePanel()
            pannel.canCreateDirectories = true
            pannel.nameFieldStringValue = "\(imageViewModel.images[index].id).jpg"
            
            pannel.begin { response in
                
                if response.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    
                    // saving
                    do {
                        try data?.write(to: pannel.url!, options: .atomicWrite)
                        print("success")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
    }
}

struct Home__Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

