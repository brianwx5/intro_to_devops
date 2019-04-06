import threading, random, time

def printer(s):
    time.sleep(random.randint(0, 2))
    print(s)

l = ["h","e", "l", "l", "o"]
for c in l:
    threading.Thread(target=printer, args=c).start()
