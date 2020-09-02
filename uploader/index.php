<?php
$path = '';
if(isset($_GET['host']))
{
	$path = $_GET['host'].'/';
	if(!is_dir('./Images/'.$path))
		mkdir('./Images/'.$path);
}

if(!isset($_GET['check']))
{
	if(!file_exists("./Images/".$path.$_FILES["file"]["name"]))
	{
		if(move_uploaded_file($_FILES['file']['tmp_name'], "./Images/".$path.$_FILES["file"]["name"]))
			echo 'File Checksum OK!';
		else
			echo 'File Reliability Check FAILED!';
	}
	else
		echo "Skipping File";
}
else
{
	if(!file_exists("./Images/".$path.'/'.$_GET['check']))
		echo 'false';
	else
		echo 'true';
}
?>