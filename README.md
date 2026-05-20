# Multithreaded Client-Server File Sharing System

A Python-based file sharing system using multithreaded TCP sockets to support simultaneous client connections.

## Features

- **File Upload & Download** – Transfer files between clients and server
- **File Listing** – Browse available files on the server
- **Integrity Verification** – SHA-256 hashing to ensure files are transferred without corruption
- **Automatic File Versioning** – Keeps track of multiple versions of the same file
- **Access Control** – Manage which users can read or write files
- **GUI / Web Interface** – User-friendly interface for interacting with the system
- **Logging** – Server-side logging of all client activity

## Tech Stack

- **Language:** Python
- **Networking:** TCP Sockets
- **Concurrency:** Multithreading
- **Hashing:** SHA-256

## Getting Started

### Prerequisites

- Python 3.x

### Run the project
- Fileshare.bat

## Usage

Once connected, clients can:

 – Upload a file to the server
 – Download a file from the server
 – List all available files on the server

## Notes

- Multiple clients can connect to the server simultaneously
- File integrity is verified automatically after every transfer using SHA-256
