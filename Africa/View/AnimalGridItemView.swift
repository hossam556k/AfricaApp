
import SwiftUI

struct AnimalGridItemView: View {

    // MARK: - PROPERTIES

    let animal: Animal

    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemViewPreview: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decode("animals")

    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
    }
}
