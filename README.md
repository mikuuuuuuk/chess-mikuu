AI Chess Web Application
A browser-based chess engine developed during my sophomore year. This project features an integrated AI opponent with three difficulty levels, implemented entirely in JavaScript to run directly in the browser.

Project Overview
The application provides a complete chess-playing experience without requiring any backend installation. It focuses on implementing search algorithms within the constraints of a client-side environment.

Key Features
Three Difficulty Levels:

Easy: AI selects moves with minimal evaluation, ideal for casual play.

Medium: Implements a Minimax search with a basic heuristic evaluation.

Hard: Uses Minimax with Alpha-Beta Pruning for optimized search depth and more competitive play.

Zero Setup: A standalone HTML file that handles rendering, game logic, and AI computations.

Responsive Design: The interface is designed to be accessible across different screen sizes.

Technical Implementation
Frontend: HTML5, CSS3, and Vanilla JavaScript.

AI Algorithms:

Minimax Algorithm: Used for decision-making by simulating potential future moves.

Alpha-Beta Pruning: Optimized the search tree to reduce computation time, allowing the AI to "see" further ahead.

Evaluation Function: A custom heuristic that weights piece value and board positioning.

How to Run
Since the entire project is contained within a single file, no complex setup is required:

Download the index.html file.

Open the file in any modern web browser (Chrome, Firefox, Safari, or Edge).

Select your preferred difficulty and start the game.
