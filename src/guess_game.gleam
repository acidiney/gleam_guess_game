import gleam/io
import gleam/string
import gleam/int
import gleam/erlang
import gleam/order.{Eq, Gt, Lt}

fn guess_control_flow(secret_number: Int, guess_times: Int) {
  let input = case erlang.get_line("Insert the number: ") {
    Ok(str) -> string.trim(str)
    Error(_) -> panic("An error occurs!")
  }

  let guess_number = case int.parse(input) {
    Ok(n) -> n
    Error(_) -> panic("An error occurs while parsing!")
  }

  let increased_guess_times = guess_times + 1

  case int.compare(guess_number, secret_number) {
    Gt -> {
      io.println("Guess lower!")
      guess_control_flow(secret_number, increased_guess_times)
    }
    Lt -> {
      io.println("Guess higher!")
      guess_control_flow(secret_number, increased_guess_times)
    }
    Eq -> {
      io.println("You won!")
      guess_times
    }
  }
}

pub fn main() {
  let secret_number = int.random(100)
  let guess_times = 1

  io.println("Game: Gess the number!")

  let maximum_guess_times = guess_control_flow(secret_number, guess_times)

  io.println(
    "You took " <> int.to_string(maximum_guess_times) <> " times to get it!",
  )
}
