import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Blob "mo:base/Blob";
import Array "mo:base/Array";

actor {
  let SubnetManager : actor {
    raw_rand() : async Blob;
  } = actor "aaaaa-aa"; // The management canister for randomness

  public func guess_number(userGuess: Nat) : async Text {
    if (userGuess < 1 or userGuess > 100) {
      return "Please enter a number between 1 and 100.";
    };

    // Fetch raw random bytes for generating the target number
    let randomBlob = await SubnetManager.raw_rand();
    let randomBytes : [Nat8] = Blob.toArray(randomBlob);

    if (Array.size(randomBytes) == 0) {
      return "Failed to generate a random number. Please try again.";
    };

    // Convert the random byte into a number between 1 and 100
    let targetNumber = Nat8.toNat(randomBytes[0]) % 100 + 1;

    // Determine if the guess is too high, too low, or correct
    let result = if (userGuess == targetNumber) {
      "🎉 Congratulations! You guessed it right! The number was " # Nat.toText(targetNumber)
    } else if (userGuess < targetNumber) {
      "Too low! Try a higher number."
    } else {
      "Too high! Try a lower number."
    };

    return result;
  };
};
