<#
Title: PowerShell IP Analysis
Author: Jamie Giannini

Scenario:
Write a Powershell script that returns the IPv4 address of the computer. Use Select-String cmdlet to only return the IPv4 address 
string and no other extraneous information.

Tasks:
[X] Create a local file called network_report.txt that holds the contents of an ipconfig /all command
[X] Use Select-String to search network_report.txt and return only the IP version 4 address
[X] Remove the network_report.txt when you are finished searching it.
[X] Use at least one variable and one function

Optional:
[X] Instead of creating network_report.txt, use piping to store the output in memory and search there  
[X] Have your script test whether the network adapter is sending and receiving packets correctly
[X] Have your script test connectivity to the internet
#>


function create_search_destroy(){
#Create a local file that holds the contents of an ipconfig /all command
$DesktopPath = [Environment]::GetFolderPath("Desktop") #grabs the correct folder path so I don't need to hardcode it
ipconfig /all > $DesktopPath/network_report.txt

#Search network_report.txt file and return IPv4 address
Select-String -Path $DesktopPath/network_report.txt -Pattern 'IPv4'

#Remove the network_report.txt when search is complete
Remove-Item -Path $DesktopPath/network_report.txt -Force
}

create_search_destroy


#Store ip output in memory, search, output result to screen
$get_ip = ipconfig /all 
$get_ip 2>&1 | Select-String -Pattern 'IPv4'

#Test network adapter sending and receiving packets
Test-NetConnection

#Test Internet connectivity
Test-Connection -ComputerName www.google.com





