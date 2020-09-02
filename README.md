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
 (It supports three very basic operations)
  1) if operation is set to 1 then transfer mode is set as "Internet Server"
  2) if operation is set to -1 then transfer mode is set as "LAN Machine"
  3) if operation is set to 0 then then no transfer will take place it will dump the scanned image file locations

How to Run for LAN transfer?
1) If you are using local LAN transfer then open the scan.bat code and update the IP address along with shared folder name in LAN
2) open the code of scan.bat and check if the operation flag is set to -1 (LAN transfer mode)
3) Simply double click or invoke the script in remote side to initialize the transfer ofcouse for LAN operation remote and receiver should be in same network


How to Run for Internet transfer?
1) open the scan.bat file and update the remote server address (use localhost if testing on local machine)
2) copy the uploader directory to the server you are using to accept and store files, e.g. in case of XAMPP copy the folder in htdocs directory
3) open the scan.bat file and set the operation flag to 1 (Internet transfer mode)
4) You are good to go now, double click or invoke script in remote side to test

How to just dump image locations in file system?
1) Just open the scan.bat code and set the operation flag to 0 (dump mode)
2) double click or invoke the file no other setup is needed
