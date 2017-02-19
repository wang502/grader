import math
import sys

def square(num):
    # return the square of given number
    # int -> int
    return num**2

if __name__ == "__main__":
    for line in sys.stdin:
        print(square(int(line)))
