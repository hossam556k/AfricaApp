
import SwiftUI

struct MapAnnotationView: View {

    // MARK: - PROPERTIES

    var location: MapLocation

    @State private var animation: Double = 0.0

    // MARK: - BODY

    var body: some View {
        ZStack {
            Circle()
                .fill()
                .frame(width: 54, height: 54)

            Circle()
                .stroke(Color.accent, lineWidth: 2)
                .frame(width: 52, height: 52)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(
                .easeOut(duration: 2)
                    .repeatForever(autoreverses: false)
            ) {
                animation = 1.0
            }
        }
    }
}

// MARK: - PREVIEW

#Preview {
    let locations: [MapLocation] =
        Bundle.main.decode("locations")

    return MapAnnotationView(location: locations[0])
}
