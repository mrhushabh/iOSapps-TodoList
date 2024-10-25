//
//  Addview.swift
//  TodoList
//
//  Created by Rhushabh Madurwar on 9/25/24.
//

import SwiftUI

struct Addview: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            TextField("Type something here...",text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(Color.white))
                .cornerRadius(10)
            
            Button(action: saveButton
                   , label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal)
            
            })
        }
        .navigationTitle("Add an Item ✒️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
            
        }
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Todo item length should be atleast 3 characters long😤"
            showAlert.toggle()
            return false
            
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
    
}

#Preview {
    NavigationView{
        Addview()
    }
    .environmentObject(ListViewModel())
}
