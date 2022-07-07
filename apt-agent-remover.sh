#!/bin/bash
#
####### HOW TO USE #########
# sudo bash apt-agent-remover.sh
#
#
#


function uninstall_agent() {
	# A function to uninstall the Agent and clean up all leftover files
        read -p "[?] Do you wish to remove the Agent? (Y/N): " REMOVE_ANSWER
        REMOVE_ANSWER=${REMOVE_ANSWER^^}
        if [ "$REMOVE_ANSWER" = "Y" ]; then
		echo "[!] Uninstalling Agent..."
		sudo systemctl disable wazuh-agent
		sudo systemctl daemon-reload
		sudo apt-get remove --purge wazuh-agent -y
		echo "[!] Successfully uninstalled the Agent."
	else
		echo "[*] The Agent was not removed."
	fi
}


uninstall_agent

