###### HOW TO USE ######
# As administrator run the PowerShell script
# powershell .\win-agent-remover.ps1
#
#
function Remove-Agent {
	$REMOVE_ANSWER = Read-Host -Prompt "[!] Do you wish to remove the Agent? (Y/N)"
	$REMOVE_ANSWER = $REMOVE_ANSWER.ToUpper()
	if ($REMOVE_ANSWER -eq 'Y') {	
		Write-Host "[*]  Starting Agent Removal..."
		try
		{
			$WAZ_AGENT = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Wazuh Agent"}
			$WAZ_AGENT.Uninstall()
			Remove-Item 'C:\Program Files (x86)\ossec-agent\' -Recurse
			Write-Host "[*] Agent successfully removed!" -ForegroundColor Green
			Exit 0
		}
		catch
		{
			Write-Host "[*] Error with: Removing Agent"
			Write-Host "[*] The Agent failed to be removed." -ForegroundColor Red
			Exit 1
		}
	}
	else {
		Write-Host "[*] The Agent was not removed."
	}
}
#
#
Remove-Agent

