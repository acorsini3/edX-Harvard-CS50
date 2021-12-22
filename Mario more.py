# Mario more
from cs50 import get_int

def main():
    size = get_int("What is the pyramid size? ")

    while size < 1 or size > 8:
        size = get_int("What is the pyramid size? ")
    #row = size
    draw(size)


def draw(size):
    row = 1
    for s in range(size):
        for r in range(size-row):
            print(" ", end ="") #number of dots is size - row
        for r in range(row):
            print("#", end ="")
        print("  ", end ="")
        for r in range(row):
            print("#", end ="")
        print("\n",end ="")
        row = row +1


if __name__ == "__main__":
	main()


# cd ~/pset6/

# python mariomore.py

# check50 cs50/problems/2021/x/sentimental/mario/more

#submit50 cs50/problems/2021/x/sentimental/mario/more