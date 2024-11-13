//
//  AddClothesView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftUI
import UIKit

struct ClothingItem: Identifiable, Codable {
    let id: UUID
    var type: String
    var color: String
    var description: String
    var imageData: Data? // Utilizziamo Data anziché UIImage per la compatibilità con Codable

    init(id: UUID = UUID(), type: String, color: String, description: String, image: UIImage?) {
        self.id = id
        self.type = type
        self.color = color
        self.description = description
        self.imageData = image?.jpegData(compressionQuality: 0.8)
    }

    var image: UIImage? {
        if let imageData = imageData {
            return UIImage(data: imageData)
        }
        return nil
    }
}

class WardrobeManager: ObservableObject {
    @Published var shirts: [ClothingItem] = [] {
        didSet { saveItems() }
    }
    @Published var jackets: [ClothingItem] = [] {
        didSet { saveItems() }
    }
    @Published var sweatshirts: [ClothingItem] = [] {
        didSet { saveItems() }
    }
    @Published var pants: [ClothingItem] = [] {
        didSet { saveItems() }
    }
    @Published var shoes: [ClothingItem] = [] {
        didSet { saveItems() }
    }
    @Published var accessories: [ClothingItem] = [] {
        didSet { saveItems() }
    }
    
    private let shirtsKey = "shirtsKey"
    private let jacketsKey = "jacketsKey"
    private let sweatshirtsKey = "sweatshirtsKey"
    private let pantsKey = "pantsKey"
    private let shoesKey = "shoesKey"
    private let accessoriesKey = "accessoriesKey"

    init() {
        loadItems()
    }
    
    func addClothingItem(_ item: ClothingItem) {
        switch item.type {
        case "Shirts":
            shirts.append(item)
        case "Jackets":
            jackets.append(item)
        case "Sweatshirts":
            sweatshirts.append(item)
        case "Pants":
            pants.append(item)
        case "Shoes":
            shoes.append(item)
        case "Accessories":
            accessories.append(item)
        default:
            break
        }
    }
    
    func saveItems() {
        do {
            let encoder = JSONEncoder()
            UserDefaults.standard.set(try encoder.encode(shirts), forKey: shirtsKey)
            UserDefaults.standard.set(try encoder.encode(jackets), forKey: jacketsKey)
            UserDefaults.standard.set(try encoder.encode(sweatshirts), forKey: sweatshirtsKey)
            UserDefaults.standard.set(try encoder.encode(pants), forKey: pantsKey)
            UserDefaults.standard.set(try encoder.encode(shoes), forKey: shoesKey)
            UserDefaults.standard.set(try encoder.encode(accessories), forKey: accessoriesKey)
        } catch {
            print("Errore nel salvataggio degli oggetti: \(error)")
        }
    }
    
    func loadItems() {
        do {
            let decoder = JSONDecoder()
            if let shirtsData = UserDefaults.standard.data(forKey: shirtsKey) {
                shirts = try decoder.decode([ClothingItem].self, from: shirtsData)
            }
            if let jacketsData = UserDefaults.standard.data(forKey: jacketsKey) {
                jackets = try decoder.decode([ClothingItem].self, from: jacketsData)
            }
            if let sweatshirtsData = UserDefaults.standard.data(forKey: sweatshirtsKey) {
                sweatshirts = try decoder.decode([ClothingItem].self, from: sweatshirtsData)
            }
            if let pantsData = UserDefaults.standard.data(forKey: pantsKey) {
                pants = try decoder.decode([ClothingItem].self, from: pantsData)
            }
            if let shoesData = UserDefaults.standard.data(forKey: shoesKey) {
                shoes = try decoder.decode([ClothingItem].self, from: shoesData)
            }
            if let accessoriesData = UserDefaults.standard.data(forKey: accessoriesKey) {
                accessories = try decoder.decode([ClothingItem].self, from: accessoriesData)
            }
        } catch {
            print("Errore nel caricamento degli oggetti: \(error)")
        }
    }
    
    func clearAllItems() {
        shirts.removeAll()
        jackets.removeAll()
        sweatshirts.removeAll()
        pants.removeAll()
        shoes.removeAll()
        accessories.removeAll()
        saveItems()
    }
}

struct AddClothesView: View {
    @EnvironmentObject var wardrobeManager: WardrobeManager
    @Binding var addingClothes: Bool
    
    var colors = ["White", "Black", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Brown", "Pink", "Multicolor"]
    @State private var selectedColor: String = "White"
    
    var types = ["Shirts", "Jackets", "Sweatshirts", "Pants", "Shoes", "Accessories"]
    @State private var selectedType: String = "Shirts"
    
    @State private var description = ""
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary

    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 300, height: 350)
                        
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 350)
                                .cornerRadius(10)
                        } else {
                            VStack {
                                Image(systemName: "camera")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                                Text("Take a photo")
                            }
                        }
                    }
                    .padding()
                }
                .actionSheet(isPresented: $showImagePicker) {
                    ActionSheet(
                        title: Text("Select Image"),
                        message: Text("Choose a source"),
                        buttons: [
                            .default(Text("Camera")) {
                                sourceType = .camera
                                showImagePicker.toggle()
                            },
                            .default(Text("Photo Library")) {
                                sourceType = .photoLibrary
                                showImagePicker.toggle()
                            },
                            .cancel()
                        ]
                    )
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        addingClothes.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newClothingItem = ClothingItem(type: selectedType, color: selectedColor, description: description, image: selectedImage)
                        wardrobeManager.addClothingItem(newClothingItem)
                        addingClothes.toggle()
                    }
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage, sourceType: sourceType)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
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

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
