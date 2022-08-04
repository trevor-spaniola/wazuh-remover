#!/bin/bash
#
####### HOW TO USE #########
# sudo bash mac-agent-remover.sh
#
#


function uninstall_agent() {
        # Function to uninstall and remove all Agent files from the system
        echo "[!] Uninstalling the Agent..."
        sudo /Library/Ossec/bin/wazuh-control stop
        sudo rm -rf /Library/Ossec
        sudo launchctl unload /Library/LaunchDaemons/com.wazuh.agent.plist
        sudo rm -f /Library/LaunchDaemons/com.wazuh.agent.plist
        sudo rm -rf /Library/StartupItems/WAZUH
        sudo dscl . -delete "/Users/wazuh"
        sudo dscl . -delete "/Groups/wazuh"
        sudo pkgutil --forget com.wazuh.pkg.wazuh-agent
        echo "[!] Successfully uninstalled the Agent."
}

if [ -d /Library/Ossec ]; then
	uninstall_agent
fi

