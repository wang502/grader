def grade(solution, submission):
    wrong = 0
    with open(submission) as file1, open(solution) as file2:
        for x, y in izip(file1, file2):
            x = x.strip()
            y = y.strip()
            if x != y:
                wrong += 1
                print("wrong anwer: " + y)
    if wrong == 0:
        print("All test cases passed!")

import sys
from itertools import izip

if __name__ == "__main__":
    grade(sys.argv[1], sys.argv[2])
