#dna

from csv import reader, DictReader
from sys import argv, exit

def main():

    if len(argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        exit(1)

    database = argv[1] #the database
    txt_file = argv[2] #and the txt file to be compared

    with open(database, "r") as csvfile: #open CSV in read mode
        reader = DictReader(csvfile) #convert to dict
        dict_list = list(reader) #a list of dictionnary

    with open(txt_file, "r") as file: #open txt file
        sequence = file.read()

    repeats = [] #initialize an empty list
    for i in range(1, len(reader.fieldnames)): #first row of csv file contains column header
        STR = reader.fieldnames[i] #start at 1 because 0 is the name
        repeats.append(0)

        for j in range(len(sequence)): #look for this STR into sequence
            counter = 0 #initiliaze counter
            if sequence[j:(j + len(STR))] == STR:
                k = 0

                while sequence[(j + k):(j + k + len(STR))] == STR: #how many times in a row
                    counter += 1
                    k += len(STR)
                if counter > repeats[i - 1]:
                    repeats[i - 1] = counter #keep the max amount of repeats


    for i in range(len(dict_list)): #a list of dictionnary
        matches = 0
        for j in range(1, len(reader.fieldnames)): #key
            if int(repeats[j - 1]) == int(dict_list[i] [reader.fieldnames[j]]): #if match
                matches += 1
            if matches == (len(reader.fieldnames) - 1): #compare number of match with number of STR
                print(dict_list[i]['name']) #print key name
                exit(0)
    print("No match") #else no match


if __name__ == "__main__":
	main()


# cd ~/pset6/dna

# python dna.py

# check50 cs50/problems/2021/x/dna

# submit50 cs50/problems/2021/x/dna