import random, time



def find_dupe_ip(list):
    for i, ip in enumerate(list):
        for i2, ip2 in enumerate(list):
            if ip == ip2 and i != i2:
                print("Found Duplicate")
                print(ip)

def find_dupe_ip2(list):
    dict = None
    for i, ip in enumerate(list):
        if dict is None:
            dict = {}
            dict[ip] = 1
        else:
            if ip in dict:
                print("Found Duplicate")
                print(ip)
            else:
                dict[ip] = 1


if __name__ == '__main__':

    # We're going to create a list of ip addresses for this exercise
    list_of_ip_addresses = []
    dupe_created = False

    # upper_limit is how many IP addresses will be created
    upper_limit = 10000
    for x in range(upper_limit):
        # 127.0.0.1
        oct_3 = random.randint(1, 255)
        oct_2 = random.randint(1, 255)
        oct_1 = random.randint(1, 255)
        oct_0 = random.randint(1, 255)
        ip_address = str(oct_3) + "." + str(oct_2) + "." + str(oct_1) + "." + str(oct_0)
        if random.randint(1,5) == random.randint(1,5) and not dupe_created:
            print("Create duplicate")
            print(ip_address)
            dupe_created = True
            list_of_ip_addresses.append(ip_address)
        list_of_ip_addresses.append(ip_address)


    print("=======================")
    print("There is the possibility of there being more than one duplicate in the list")
    print("Running O(n^2) function")
    start_time = time.time()
    find_dupe_ip(list_of_ip_addresses)
    elapsed_time = time.time() - start_time
    print("[O(n^2) function] [Execution Time %s] [n == %s]" % (str(elapsed_time), str(upper_limit)))
    print("=======================")
    print("There is the possibility of there being more than one duplicate in the list")
    print("Running O(n) function")
    start_time = time.time()
    find_dupe_ip2(list_of_ip_addresses)
    elapsed_time = time.time() - start_time
    print("[O(n) function] [Execution Time %s] [n == %s]" % (str(elapsed_time),  str(upper_limit)))



