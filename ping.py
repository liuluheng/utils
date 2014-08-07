#!/usr/bin/env python
# -*- coding:utf8 -*-
import Queue
import threading
import subprocess
import re
import sys

lock = threading.Lock()
def getip(ip):
    a  = re.match(r'(.*\d+)\.(\d+)-(\d+)',ip)
    print a.groups()
    start = int(a.group(2))
    end = int(a.group(3))+1
    iplist = []
    for i in range(start,end):
        iplist.append(a.group(1)+"."+str(i))
    return iplist

def ping(qlist):
    while 1:
        if qlist.empty(): 
            sys.exit() 
        ip = qlist.get()
        ret=subprocess.call("ping -c 1 %s" \
            % ip,stdout=open('/dev/null','w'),\
            stderr=subprocess.STDOUT,shell=True)
        lock.acquire()
        if ret==0:
            print "%s is Alive " % ip
        else:
            pass
        lock.release()
        qlist.task_done()    

def main():
    queue = Queue.Queue()
    for i in getip(sys.argv[1]):
        queue.put(i)

    for q in range(int(sys.argv[2])): 
        worker=threading.Thread(target=ping,args=(queue,)) 
        worker.setDaemon(True) 
        worker.start() 
    queue.join() 

if __name__=="__main__": 
    if len (sys.argv) != 3:
        print "usage %s IP段(192.168.1.1-254) 线程数" % sys.argv[0]
    else:
        main()
