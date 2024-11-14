import SwiftUI

struct ContentView: View {
    @State private var diceNumber = 1 // Track the current dice face
    @State private var isRolling = false // Control to disable button while rolling

    var body: some View {
        VStack(spacing: 30) {
            Text("Roll the Dice")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            // Dice image that updates based on diceNumber
            Image("dice_\(diceNumber)")
                .resizable()
                .frame(width: 150, height: 150) // Adjust size as needed
                .transition(.scale) // Optional transition animation
                .animation(.easeInOut(duration: 0.3), value: diceNumber)
            
            Spacer()
            
            // Roll button
            Button(action: {
                rollDice()
            }) {
                Text("Roll Dice")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(isRolling) // Disable button while rolling animation plays
        }
        .padding()
    }
    
    // Function to roll the dice
    func rollDice() {
        isRolling = true // Start rolling

        // Loop through random numbers quickly to simulate rolling
        let totalRolls = 10 // Number of random changes to simulate rolling
        for i in 0..<totalRolls {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(i)) {
                diceNumber = Int.random(in: 1...6) // Change to a random dice face
            }
        }
        
        // Finish rolling after the loop and re-enable the button
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isRolling = false // Allow button press again
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
