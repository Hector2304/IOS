import Foundation

enum ValidationError: Equatable {
    case empty
    case invalidFormat
    case tooShort(min: Int)

    var message: String {
        switch self {
        case .empty:
            return "Este campo es obligatorio"
        case .invalidFormat:
            return "El formato no es válido"
        case .tooShort(let min):
            return "Debe tener al menos \(min) caracteres"
        }
    }
}

// MARK: - Login

protocol LoginValidatorProtocol {
    func validateEmail(_ email: String) -> ValidationError?
    func validatePassword(_ password: String) -> ValidationError?
}

struct LoginValidator: LoginValidatorProtocol {
    func validateEmail(_ email: String) -> ValidationError? {
        let trimmed = email.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmed.isEmpty else {
            return .empty
        }

        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let isValid = trimmed.range(
            of: pattern,
            options: .regularExpression
        ) != nil

        return isValid ? nil : .invalidFormat
    }

    func validatePassword(_ password: String) -> ValidationError? {
        guard !password.isEmpty else {
            return .empty
        }

        return nil
    }
}

// MARK: - Registro

protocol SignUpValidatorProtocol {
    func validateEmail(_ email: String) -> ValidationError?
    func validatePassword(_ password: String) -> ValidationError?
}

struct SignUpValidator: SignUpValidatorProtocol {
    private let minPasswordLength = 8

    func validateEmail(_ email: String) -> ValidationError? {
        let trimmed = email.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmed.isEmpty else {
            return .empty
        }

        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let isValid = trimmed.range(
            of: pattern,
            options: .regularExpression
        ) != nil

        return isValid ? nil : .invalidFormat
    }

    func validatePassword(_ password: String) -> ValidationError? {
        guard !password.isEmpty else {
            return .empty
        }

        guard password.count >= minPasswordLength else {
            return .tooShort(min: minPasswordLength)
        }

        let pattern = #"^(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9\s]).+$"#
        let isValid = password.range(
            of: pattern,
            options: .regularExpression
        ) != nil

        return isValid ? nil : .invalidFormat
    }
}
