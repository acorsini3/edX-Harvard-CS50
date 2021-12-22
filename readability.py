#readability

from cs50 import get_string

def main():

    letters = 0
    words = 1 # initialized at 1 because of isspace
    sentences = 0

    text = get_string("Text: ")
    text_length = len(text)

    for i in range(text_length): #count letters
        if(text[i].isalpha()):
            letters+=1
            #print("letters" + str(letters))

        if (text[i].isspace()): #count words
            words +=1
            #print("words" + str(words))

        if(text[i] == '.' or text[i] == '?' or text[i] == '!'): #count sentences
            sentences +=1
            #print("setences" + str(sentences))

    L = (letters/words)*100
    S = (sentences/words)*100
    formula = (0.0588 * L) - (0.296 * S) - 15.8
    #print(formula)
    grade = round(formula)

    if grade < 1:
        print("Before Grade 1")
    elif grade > 16:
        print("Grade 16+")
    else:
        print(f"Grade {grade}")


if __name__ == "__main__":
	main()


# cd ~/pset6/readability

# python readability.py

# check50 cs50/problems/2021/x/sentimental/readability

# submit50 cs50/problems/2021/x/sentimental/readability