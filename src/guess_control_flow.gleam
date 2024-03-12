import gleam/erlang.{get_line}
import gleam/order.{Eq, Gt, Lt}
import gleam/string.{trim}
import gleam/io.{println, println_error}
import gleam/int.{compare, parse}

pub fn exec(secret_number: Int, guess_times: Int) {
  let assert Ok(input) = get_line("Insert the number: ")

  let guess_number = case parse(trim(input)) {
    Ok(n) -> n
    Error(_) -> {
      println_error(
        "You've to insert a valid positive number between 0 and 100",
      )
      exec(secret_number, guess_times)
    }
  }

  let increased_guess_times = guess_times + 1

  case compare(guess_number, secret_number) {
    Gt -> {
      println("Guess lower!")
      exec(secret_number, increased_guess_times)
    }
    Lt -> {
      println("Guess higher!")
      exec(secret_number, increased_guess_times)
    }
    Eq -> {
      println("You won!")
      guess_times
    }
  }
}
