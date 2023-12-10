struct User: Hashable {
    static var users = ["Павел Терешонок", "Александр Стос", "Дмитрий Арбузов", "Владимир Путин", "Рик Санчес", "Алина Терешонок"].map({ name in
        return User(name: name, category: Category.randomOrNil)
    })
    let name: String
    let category: Category?
    
    static func filterUsers(by category: Category?) -> [User] {
        users.filter({
            $0.category == category
        })
    }
}

enum Category: CaseIterable {
    case work
    case favorite
    case player
    
    static var randomOrNil: Category? {
        Bool.random() ? nil : Category.allCases.randomElement()
    }
    
    var title: String {
        switch self {
        case .favorite: "Избранные"
        case .work: "Работа"
        case .player: "Игроки"
        }
    }
}




