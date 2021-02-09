def prompt(str)
  puts "=> " + str
end

def not_number?(num)
  digits = num.split(//)
  if digits.include?('.')
    num.to_f.to_s != num
  else
    num.to_i.to_s != num
  end
end

def zero?(num)
  num.to_f <= 0
end

loop do
  # Username prompt and validation section
  prompt "Welcome to the loan payment calculator! What is your name?"
  username = ''
  loop do
    username = gets.chomp
    if username.empty?
      prompt "Please enter your name!"
    else
      break
    end
  end

  # Loan amount prompt and validation
  prompt "OK #{username}, how much are you borrowing? Please enter a dollar amount."
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if not_number?(loan_amount) || zero?(loan_amount)
      prompt "Please enter a number greater than zero."
    else
      break
    end
  end

  # Apr prompt and validation
  prompt "You are borrowing $#{loan_amount}. What is your apr?"
  apr = ''
  loop do
    apr = gets.chomp
    if not_number?(apr) || zero?(apr)
      prompt "Please enter a number greater than zero."
    else
      break
    end
  end

  # Loan duration prompt and validation
  prompt "Your APR is #{apr}. What is the loan duration in years?"
  years = ''
  loop do
    years = gets.chomp
    if not_number?(years) || zero?(years)
      prompt "Please enter a number greater than zero."
    else
      break
    end
  end

  # Conversion to units to be used in calculation
  monthly_rate = (apr.to_f / 100) / 12
  months = years.to_f * 12

  # Calculation
  monthly_payment = loan_amount.to_i * (monthly_rate / (1 - ((1 + monthly_rate)**(-months))))

  prompt "Thanks, #{username}, your monthly payment will be: $#{format('%.2f', monthly_payment)}"

  prompt "Would you like to do another calculation? Y/N"
  again = gets.chomp
  break unless again.downcase == 'y'
end