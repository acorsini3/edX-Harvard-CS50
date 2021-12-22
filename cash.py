from cs50 import get_float

def main():

    while True:
        change = get_float("Change owed: ")
        if change > 0:
            break

    cent  = round(change * 100)

    coins = 0
    quarter = 0
    dime = 0
    nickel = 0
    penny = 0

    while cent >= 25:
        cent = cent - 25
        quarter += 1

    while cent >= 10:
        cent = cent - 10
        dime += 1

    while cent >= 5:
        cent = cent - 5
        nickel += 1

    while cent >=1:
        cent = cent - 1
        penny += 1

    coins  = quarter + dime + nickel + penny
    print(coins)


if __name__ == "__main__":
	main()




# cd ~/pset6/cash

# python cash.py

# check50 cs50/problems/2021/x/sentimental/cash

# submit50 cs50/problems/2021/x/sentimental/cash