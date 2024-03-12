import gleam/io.{println}
import gleam/int.{random, to_string}
import guess_control_flow

pub fn main() {
  let secret_number = random(100)
  let guess_times = 1

  println("Game: Gess the number!")

  let maximum_guess_times = guess_control_flow.exec(secret_number, guess_times)

  println("You took " <> to_string(maximum_guess_times) <> " times to get it!")
}
