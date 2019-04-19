import random, sys

if __name__ == '__main__':
    exit_codes = []
    r = None
    for c in range(0,10):
        exit_code = random.randint(0, 2)
        print("Python Yields - Exit Code: %i \n" %(exit_code), file=sys.stdout)
        exit_codes.append(exit_code)
    exit(exit_codes[random.randint(0, len(exit_codes) -1)])