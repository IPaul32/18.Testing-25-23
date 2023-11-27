import random

def play_rps():
    user_choice = input("Choose: rock (r), scissors (s) or paper (p): ")
    computer_choice = random.choice(['r', 's', 'p'])

    print(f'Computer choice: {computer_choice}')

    if user_choice == computer_choice:
        return "Draw!"
    elif (user_choice == 'r' and computer_choice == 's') or \
         (user_choice == 's' and computer_choice == 'p') or \
         (user_choice == 'p' and computer_choice == 'r'):
        return "You win!"
    else:
        return "Computer win!"

result = play_rps()
print(result)
