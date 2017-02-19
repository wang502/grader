import sys
from itertools import izip

def grade(solution, submission):
    wrong, count = 0, 0
    with open(submission) as file1, open(solution) as file2:
        for x, y in izip(file1, file2):
            count += 1
            x = x.strip()
            y = y.strip()
            print("Your solution: " + x + " answer: " + y)
            if x != y:
                wrong += 1
                print(" --> wrong anwer: " + x)
    print(str(count-wrong) + "/" + str(count) + " correct")
    if wrong == 0:
        print("All test cases passed!")

if __name__ == "__main__":
    grade(sys.argv[1], sys.argv[2])
