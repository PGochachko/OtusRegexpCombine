//
//  ContentView.swift
//  OtusRegexpCombine
//
//  Created by Павел on 30.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI
import Combine

struct Field {
    var text: String = ""
    var colorValid: Color = Color.gray
}

class ContentViewModel: ObservableObject {
        
    var subject = PassthroughSubject<Void, Never>()
    var cancellable = Set<AnyCancellable>()
    
    @Published var phone: Field = Field()
    @Published var email: Field = Field()
    @Published var fullName: Field = Field()
    @Published var dateOfBirth: Field = Field()
    @Published var password: Field = Field()
    
    init() {
        subject.sink { _ in
            self.phone.colorValid = Validation.isPhoneValid(value: self.phone.text, requered: true) ? Color.gray : Color.red
            self.email.colorValid = Validation.isEmailValid(value: self.email.text) ? Color.gray : Color.red
            self.fullName.colorValid = Validation.isFullNameValid(value: self.fullName.text, requered: true) ? Color.gray : Color.red
            self.dateOfBirth.colorValid = Validation.isDateOfBirthValid(value: self.dateOfBirth.text) ? Color.gray : Color.red
            self.password.colorValid = Validation.isPasswordValid(value: self.password.text, requered: true) ? Color.gray : Color.red
        }
        .store(in: &self.cancellable)
    }
    
    func checkFiels() {
        subject.send()
    }
}

struct ContentView: View {
     @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                TextField("Телефон (Обязательное поле)", text: $viewModel.phone.text)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(viewModel.phone.colorValid)
            }
            .padding()
            VStack {
                TextField("Email", text: $viewModel.email.text)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(viewModel.email.colorValid)
            }
            .padding()
            VStack(alignment: .leading) {
                TextField("Ф.И.О. (Обязательное поле)", text: $viewModel.fullName.text)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(viewModel.fullName.colorValid)
            }
            .padding()
            VStack(alignment: .leading) {
                TextField("Дата рождения", text: $viewModel.dateOfBirth.text)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(viewModel.dateOfBirth.colorValid)
            }
            .padding()
            VStack {
                SecureField("Пароль (Обязательное поле)", text: $viewModel.password.text)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(viewModel.password.colorValid)
            }
            .padding()
            Button(action: {
                self.viewModel.checkFiels()
            }) {
                Text("Submit")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
