//
//  AddClothesView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftUI

struct AddClothesView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var addingClothes: Bool
    
    var colors = ["White", "Black", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Brown", "Pink", "Multicolor"]
    @State var selectedColor: String = "White"
    
    var types = ["Jackets", "Sweatshirts", "Shirts", "Pants", "Shoes"]
    @State var selectedType: String = "Jackets"
    
    @State var description = ""
    @State private var image: UIImage?
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    print("This is a button")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                            .opacity(0.5)
                            .padding()
                            .frame(width: 300, height: 350)
                        VStack {
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width: 50, height: 40)
                            Text("Take a photo")
                        }
                    }
                }
                HStack {
                    Text("Color:")
                        .font(.title2)
                        .bold()
                    Picker("Colors", selection: $selectedColor) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                HStack {
                    Text("Type:")
                        .font(.title2)
                        .bold()
                    Picker("Types", selection: $selectedType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding(.bottom, 20)
                VStack {
                    Text("Description:")
                        .font(.title2)
                        .bold()
                    TextField("(Optional)", text: $description, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 70)
                }
            }
            .padding(.bottom, 30)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        addingClothes.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newItem = Clothe(color: selectedColor, clotheType: selectedType, clotheDescription: description.isEmpty ? nil : description)
                        modelContext.insert(newItem)
                        addingClothes.toggle()
                    }
//                    .disabled(true) // To ensure they fill in the photo, color and type later
                }
            })
        }
    }
}

#Preview {
    AddClothesView(addingClothes: .constant(true))
}

// Camera Code
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
