from socket import *
import threading
import os
import hashlib
import logging
from datetime import datetime



host = '0.0.0.0'    
port =  23456      
buffer_size = 4096  
shared = 'shared_files'  
versions = {} 


#allow to program to save server logs in the file
logging.basicConfig(
    filename=os.path.join('logs', 'server_log.log'), 
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def log(msg):
    print(msg)
    logging.info(msg)

#hashes the file using SHA-256
def hashing(file):
    hashed = hashlib.sha256()
    with open(file, "rb") as f:
        block = f.read(buffer_size)
        while block:
            hashed.update(block)
            block = f.read(buffer_size)
                        
    return hashed.hexdigest()

#function to create a new version of a file
def newVersion(file):
    #set the name of the new file as name_v2
    base, ext = os.path.splitext(file)
    v = 2
    new = f"{base}_v{v}{ext}"
    #while file with current version exits in the shared files keep incrementing the version
    while os.path.exists(os.path.join(shared, new)):
        v += 1
        new = f"{base}_v{v}{ext}"
    return new

#function that handles uploading files to the server
def upload(conn, file, size):
    
    path = os.path.join(shared, file)

    #checks if file already exists create a new version
    if os.path.exists(path):
        log(f"'{file}' already exists. creating a new version")
        file = newVersion(file)
        path = os.path.join(shared, file)

    #recieving the file data
    with open(path, 'wb') as f:
        rem = size 
        while rem > 0:
            if rem < buffer_size:
                data = conn.recv(rem)
            else:
                data = conn.recv(buffer_size)
            if not data:
                break
            f.write(data)
            rem -= len(data)

    #compute hash and compare it with the recieved one
    recieved = conn.recv(64).decode().strip()
    computed= hashing(path)

    if recieved == computed:
        log(f"'{file}' uploaded successfully")
        conn.sendall(b"Success")
    else:
        log(f"failed to upload '{file}'")
        conn.sendall(b"Fail")

#function that handles downloading files from the server
def download(conn, file):
    
    path = os.path.join(shared, file)
    #checking if the file being requested by user exists on the server
    if not os.path.exists(path):
        conn.sendall(b"ERROR file requeted does not exist.")
        return

    size = os.path.getsize(path)
    conn.sendall(f"Success {size}".encode())

    #waits for the client to confirm
    ack = conn.recv(1024).decode()
    if ack != "READY":
        return  

    #sending the file
    with open(path, 'rb') as f:
        while 1:
            data = f.read(buffer_size)
            if not data:
                break
            conn.sendall(data)

    #hashing the file and send it 
    hashed = hashing(path)
    conn.sendall(hashed.encode())
    
def remove(conn, file):
    path = os.path.join(shared, file)
    if not os.path.exists(path):
        conn.sendall(b"ERROR file not found.")
        return
    try:
        os.remove(path)
        log(f"'{file}' deleted by admin")
        conn.sendall(b"Success")
    except Exception as e:
        log(f"Failed deleting '{file}': {e}")
        conn.sendall(b"ERROR server problem.")

#function to list the files
def List(conn):
    files = os.listdir(shared)
    if not files:
        conn.sendall(b"no files found")
    else:
        files = "\n".join(files)
        conn.sendall(files.encode())

#function for the thread that handles each client
def thread(conn, addr):
    log(f"Client connected : {addr}")
    try:
        while 1:
            #recieve command from client
            data = conn.recv(1024).decode()
            if not data:
                break

            msg = data.strip().split()
            
            #call the neccasry function depedning on command requested
            msg[0] = msg[0].lower()
            if msg[0] == "upload":
                
                file = msg[1]
                size = int(msg[2])
                upload(conn, file, size)

            elif msg[0]== "download":
                file = msg[1]
                download(conn, file)

            elif msg[0] == "list":
                List(conn)

            elif msg[0] == "delete":
                file = msg[1]
                remove(conn, file)

            elif msg[0] == "exit":
                log(f"Client {addr} disconnected.")
                break
            

            else:
                conn.sendall(b"ERROR invalid command!")

    except Exception as e:
        log(f"Error hadnling client {addr}: {e}")
    finally:
        conn.close()


def main():
    #Tcp server socket
    sock = socket(AF_INET, SOCK_STREAM)
    sock.bind(('',port))
    sock.listen(100)

    while 1:
        client, addr = sock.accept()
        th = threading.Thread(target= thread, args=(client, addr), daemon=True)
        th.start()

if __name__ == "__main__":
    main()
