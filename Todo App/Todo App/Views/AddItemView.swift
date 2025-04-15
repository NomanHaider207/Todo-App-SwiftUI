//
//  AddItemView.swift
//  Todo App
//
//  Created by Dev  on 4/14/25.
//

import SwiftUI

struct AddItemView: View {
    @State var text: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode)  var presentationMode
    
    
    @State var alertTitle:String = ""
    @State var showAlert: Bool = false
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Item", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                
                Button {
                    saveButtonPressed(title: text)
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(16)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(title: String){
        if isAppopriateText(){
            listViewModel.addItem(title: title)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isAppopriateText() -> Bool {
        if text.count >= 3{
            return true
        }
        alertTitle = "Your new todo Item must be at least 3 characters long. 😒"
        showAlert.toggle()
        return false
    }
    func getAlert() -> Alert{
       return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddItemView()
    }
    .environmentObject(ListViewModel())
    
}
