Number Guessing Game
Welcome to the Number Guessing Game! This game is built on the Internet Computer platform. Players try to guess a randomly generated number by receiving feedback on each guess, making it a fun and engaging way to test your intuition. This project includes a backend service written in Motoko and a frontend application built with React.

Project Structure
The project directory consists of:

src/ - Contains both frontend and backend code.
frontend/ - A React-based frontend application where players can input their guesses and receive feedback.
backend/ - A Motoko-based backend service that generates a random number and processes guesses.
dfx.json - The configuration file for the project, defining canister settings.
package.json - Dependencies and scripts for frontend development.
Prerequisites
DFX (Dfinity SDK): Follow the DFX installation guide to set it up.
Node.js: Ensure you have Node.js installed to support the frontend development environment.
Quick Start
Follow these steps to run the project locally.

Starting the Local Development Environment
Enter the project directory:

bash
复制代码
cd game/
Start the local replica in the background:

bash
复制代码
dfx start --background
Deploy the project to the local replica:

bash
复制代码
dfx deploy
Once deployment is complete, you can access the application using the generated canister ID, e.g., http://localhost:4943?canisterId={asset_canister_id}.

Development Environment Setup
Updating Candid Interface
If you make changes to the backend, it’s recommended to update the generated Candid interface:

bash
复制代码
npm run generate
Frontend Development
To start the frontend development server:

bash
复制代码
npm start
The frontend will be available at http://localhost:8080 and will automatically proxy API requests to the replica on port 4943.

How to Play the Game
Login: Players log in using Internet Identity.
Gameplay: Enter a number between 1 and 100 as your guess.
Feedback: The backend generates a random number, compares it with the player’s guess, and returns feedback:
Correct guess
Too high
Too low
Repeat: Based on the feedback, players can adjust their guess and submit again.
Key Features
Random Number Generation: The backend uses the raw_rand interface for secure random number generation.
User Authentication: Players authenticate using Internet Identity, ensuring a secure experience.
Real-time Feedback: Each guess yields immediate feedback displayed on the interface.
File Overview
main.mo - The backend Motoko code containing random number generation and guess validation logic.
App.jsx - The frontend React component providing the user interface and gameplay interactions.
index.html - The HTML template for the frontend.
Documentation and Resources
Quick Start Guide
Motoko Programming Guide
DFX CLI Reference
Deploying to Production
When deploying to production, ensure the following settings:

Set DFX_NETWORK to ic to prevent fetching an insecure root key in production.
In dfx.json, set canisters -> {asset_canister_id} -> declarations -> env_override to replace process.env.DFX_NETWORK correctly.
Customize the createActor function to suit production requirements as needed.
Feedback and Contributions
Suggestions and feedback are welcome! Feel free to open an issue for discussions or improvements.

