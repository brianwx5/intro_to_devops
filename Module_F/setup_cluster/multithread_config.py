import subprocess, threading, queue, os

pool = queue.Queue()

def worker():
    while True:
        item = pool.get()
        print(item)
        cmd_list= item.split("*")
        cmd_list.append("ps -ef")
        #output = subprocess.Popen(["ssh", "-o", " StrictHostKeyChecking no", "-i",  "clusterkey", "root@172.17.0.3", "ps -ef"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        output = subprocess.Popen(cmd_list, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        so, er = output.communicate()
        cmd_output = str(so.decode("utf-8"))
        print(cmd_list)
        print(cmd_output)
        pool.task_done()


# We're going to execute a cat command and get it's output
output = subprocess.Popen(['cat', './manage_list.txt'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

so, er = output.communicate()

# Beware of how "text" is encoded on an operating system, we're converting standard out to a byte stream

ip_list = str(so.decode("utf-8")).split("\n")
for i in ip_list[:-1]:
    command = "ssh*-o*StrictHostKeyChecking no*-i*clusterkey*root@"+i
    pool.put(command)
    pass


for i in range(3):
     t = threading.Thread(target=worker)
     t.daemon = True
     t.start()

pool.join()