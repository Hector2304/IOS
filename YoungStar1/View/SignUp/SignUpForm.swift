//
//  SignUpForm.swift
//  YoungStar1
//
//  Created by Jorge Arturo Young Medina on 15/10/26.
//

import Foundation

struct SignUpForm {
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let phone: String
    let birthDate: Date
    let password: String
    let confirmPassword: String
    let acceptedTerms: Bool

    func validationError(today: Date = Date()) -> String? {
        let requiredFields = [firstName, lastName, username, email, phone, password, confirmPassword]
        if requiredFields.contains(where: { $0.trimmingCharacters(in: .whitespaces).isEmpty }) {
            return "Completa todos los campos."
        }
        if username.contains(" ") {
            return "El nombre de usuario no debe tener espacios."
        }
        let parts = email.split(separator: "@")
        if parts.count != 2 || !parts[1].contains(".") {
            return "Escribe un correo válido."
        }
        if phone.filter(\.isNumber).count != 10 {
            return "El teléfono debe tener 10 dígitos."
        }
        let age = Calendar.current.dateComponents([.year], from: birthDate, to: today).year ?? 0
        if age < 13 {
            return "Debes tener al menos 13 años."
        }
        if password.count < 8 {
            return "La contraseña debe tener al menos 8 caracteres."
        }
        if password != confirmPassword {
            return "Las contraseñas no coinciden."
        }
        if !acceptedTerms {
            return "Debes aceptar los términos y condiciones."
        }
        return nil
    }
}
