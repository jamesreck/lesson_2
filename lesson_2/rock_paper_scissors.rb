# Ask the user to choose rock, paper or scissors
# The computer will then choose.
# The program will decide who won and display the winner
# The program will ask if the user wants to play again

COMBATANTS = %w(rock paper scissors lizard spock)
VALID_CHOICES = %w(rock r paper p scissors sc lizard l spock sp)

SCISSORS_BEATS = %w(paper lizard)
PAPER_BEATS = %w(rock spock)
ROCK_BEATS = %w(scissors lizard)
LIZARD_BEATS = %w(spock paper)
SPOCK_BEATS = %w(rock scissors)

win_conditions = {  scissors: SCISSORS_BEATS,
                    paper: ["rock", "spock"],
                    rock: ["scissors", "lizard"],
                    lizard: %w(spock paper),
                    spock: %w(rock scissors)
                    }

def prompt(message)
  puts "=> #{message}"
end

=begin
def win?(first, second)
  first_sym = first.to_sym
  win_conditions[first_sym].include?(second)
end
=end

=begin
def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end
=end

still_playing = true
player_score = 0
computer_score = 0

while still_playing
  choice = ''
  loop do
    prompt "Choose one: #{COMBATANTS.join(', ')}"
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That is not a valid choice. Please try again."
    end
  end

  case choice
    when "sc"
      choice = "scissors"
    when "r"
      choice = "rock"
    when "p"
      choice = "paper"
    when "l"
      choice = "lizard"
    when "sp"
      choice = "spock"
    else
      choice
  end

  computer_choice = COMBATANTS.sample

  prompt "You chose: #{choice}. The computer chose: #{computer_choice}."

  if win_conditions[choice.to_sym].include?(computer_choice)
    player_score += 1
    prompt "You win!"
  elsif win_conditions[computer_choice.to_sym].include?(choice)
    prompt "Computer wins!"
    computer_score += 1
  else
    prompt "It's a tie!"
  end

  prompt "The score is: Player: #{player_score}, Computer: #{computer_score}."

  if player_score == 5
    prompt "You win the match!"
    prompt "Goodbye!"
    still_playing = false
  elsif computer_score == 5
    prompt "The computer wins the match!"
    prompt "Goodbye!"
    still_playing = false
  end

  prompt "Do you want to play again?"
  answer = gets.chomp.downcase
  if answer != "y"
    still_playing = false
  end
end
