# Image-Finder-and-Sender
A batch file script written to automatically traverse all the file system of windows operating system and look for images (Compaitaible with Windows 10) and then transfer the data either in LAN to other machine or via internet to some server.

Prerequisites
1) Curl should be Present in the machine where script will run
2) A remote http/https appache server along with PHP to accept the file upload (just in case if you are using to send over internet)

Things to Do
1) Add command line arguments to control the script
2) Download CURL if not present in the system and then utilize it 

Bugs
1) Ping is not working to detect local machine/internet server presence

Operations
It supports three very basic operations
  1) if operation is set to 1 then transfer mode is set as "Internet Server"
  2) if operation is set to -1 then transfer mode is set as "LAN Machine"
  3) if operation is set to 0 then then no transfer will take place it will dump the scanned image file locations
