# guess

import sys
import random

def main():
	user_guess = 0
	attemp = 0
	secret_number = random.randrange(10)

	while user_guess != secret_number:
		attemp = attemp + 1
		print('What is the secret number?')
		user_guess = int(input())

	print("You have correctly guessed the secret number after " + str(attemp) + " attemps !")


if __name__ == "__main__":
	main()

# cd ~/pset6/

#python guess.py