🔤 ScrambledWord

ScrambledWord is a fun word puzzle game built with SwiftUI.
Players unscramble shuffled letters to form the correct word. Currently, the game works for a single word, but it is designed to be extended into a list of words where the player progresses through multiple challenges.


🛠 Tech Stack

SwiftUI → Declarative UI framework

Protocols & Identity → Identifiable, Hashable, Equatable for data models

Extensions → Reusable view and model utilities

State Management → @State for handling user guesses and game state


🚀 Features

🎨 Clean UI with letter tiles

🖱 Tap-based interaction to select and deselect letters

🔄 Automatic validation once all letters are guessed

✅ Check if guessed word matches the correct answer

📈 Extendable to word lists → once a word is solved, move to the next



📖 How It Works

A word (e.g., ORANGE) is scrambled into letter tiles.

Player taps letters to form their guess.

Once all letters are selected, the guess is validated.

If correct ✅ → proceed to the next word.

If incorrect ❌ → try again.
