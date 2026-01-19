from socket import *
import os
import hashlib
import logging
from datetime import datetime


host = '127.0.0.1'  
port = 23456
buffer_size = 4096


#allow to program to save client logs in the file
logging.basicConfig(
    filename=os.path.join('logs', 'client_log.log'),
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def log(msg):
    print(msg)
    logging.info(msg)

#hashinges the file using SHA-256
def hashing(file):
    hashed = hashlib.sha256()
    with open(file, "rb") as f:
        block = f.read(buffer_size)
        while block:
            hashed.update(block)
            block = f.read(buffer_size)
                        
    return hashed.hexdigest()

#function that handles uploading files to the server
def upload(sock, path):
    
    #checks if file that is to be uploaded exists
    if not os.path.exists(path):
        log(f"File '{path}' does not exist.")
        return

    #getting the name and size fo the file
    file = os.path.basename(path)
    size = os.path.getsize(path)

    #sends the command to the server 
    sock.sendall(f"upload {file} {size}".encode())

    #open the file and send it
    with open(path, 'rb') as f:
        while 1:
            data = f.read(buffer_size)
            if not data:
                break
            sock.sendall(data)

    #compute hash of the file and send it
    hashed = hashing(path)
    sock.sendall(hashed.encode())

    #recieve the respose(if hash matched or not)
    resp = sock.recv(1024).decode()
    if resp == "Success":
        log(f"'{file}' uploaded successsfully")
    else:
        log(f"failed to upload '{file}'")

#function that handles downloading files from the server
def download(sock, file):
    #sends the command to server
    sock.sendall(f"download {file}".encode())

    #wait for server response
    resp = sock.recv(1024).decode().strip()
    if resp.startswith("ERROR"):
        log(resp)
        return
    if not resp.startswith("Success"):
        log("ERROR")
        return

    _, size = resp.split()
    size = int(size)

    #inform the server that client is ready to recieve file
    sock.sendall(b"READY")

    #recieve the file in the downloads folder
    recived = os.path.join("downloads",file)
    with open(recived, 'wb') as f:
        rem = size
        while rem > 0:
            if rem < buffer_size:
                data = sock.recv(rem)
            else:
                data = sock.recv(buffer_size)
            if not data:
                break
            f.write(data)
            rem -= len(data)

    #compute hash and compare it with the recieved one
    recv = sock.recv(64).decode().strip()
    computed = hashing(recived)

    if recv== computed:
        log(f"'{file}' downloaded successfully")
        sock.sendall(b"Success")
    else:
        log(f"failed to downaload '{file}'")
        sock.sendall(b"Fail")


def delete(sock, file):
    sock.sendall(f"delete {file}".encode())
    resp = sock.recv(1024).decode().strip()
    return resp  
    
#function to list the files
def List(sock):
    #send list command to the server
    sock.sendall(b"list")
    #recieve the list of files and display them 
    resp = sock.recv(4096).decode()
    log("Files on server:\n" + resp)

def main():
    #Tcp client socket
    sock = socket(AF_INET, SOCK_STREAM)
    sock.connect((host,port))

    while True:
        #promts the user to enter a command
        cmd = input("\nEnter one of the following commands (upload <file>, download <file>, list, quit): ").strip()
        if not cmd:
            continue
        #calls the neccsasy functions depending on the command requested
        msg = cmd.split()
        msg[0] = msg[0].lower()

        if msg[0]== "upload" and len(msg) == 2:
            upload(sock, msg[1])

        elif msg[0] == "download" and len(msg) == 2:
            download(sock, msg[1])

        elif msg[0] == "list":
            List(sock)

        elif msg[0] == "quit":
            sock.sendall(b"QUIT")
            log("Exiting client.")
            break

        else:
            log("Invalid command!")

if __name__ == "__main__":
    main()
