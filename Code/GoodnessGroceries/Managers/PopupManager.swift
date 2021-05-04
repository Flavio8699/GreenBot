import Foundation

class PopupManager: ObservableObject {
    
    @Published var showPopup: Bool = false
    @Published var currentPopup: PopupType? = nil {
        didSet {
            self.showPopup = true
        }
    }
    
}

enum PopupType {
    case error(PopupErrorType)
    case message(title: String, message: String)
    case indicator(indicator: Indicator)
    case category(category: Category)
}

enum PopupErrorType: Error {
    case network, general
}
