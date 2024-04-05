#!/bin/bash
while true; do
    clear
    echo""
    echo ' ██████╗        █████╗ ████████╗██╗   ██╗
 ██╔══██╗      ██╔══██╗╚══██╔══╝██║   ██║
 ██║  ██║█████╗███████║   ██║   ██║   ██║
 ██║  ██║╚════╝██╔══██║   ██║   ██║   ██║
 ██████╔╝      ██║  ██║   ██║   ╚██████╔╝
 ╚═════╝       ╚═╝  ╚═╝   ╚═╝    ╚═════╝ 
 by SalarSalari'
    echo "#==========> Welcome, $USER <==========#"
    echo "Menu:"
    echo "1. Connect to SSH server"
    echo "2. SSH Connector!"
    echo "3. Pinger!"
    echo "4. Hashcat!"
    read -p "-> " choice

    case "$choice" in
        1)
            echo "Connecting to Server..."
            ssh username@ipordomain #if you have a server to connect all day 
            ;;
        2)
            read -p "Enter the Username: " usrnme
            read -p "Enter the IP address: " ip
            echo "Connecting to the Server you entered..."
            ssh "$usrnme"@"$ip"
            ;;

        3)
            read -p "Enter the IP address: " ip2
            echo "Pinging the Server..."
            ping -c 2 "$ip2"
            read -p "Press Any key to Procced to the main menu."
            ;;

	    4)
            clear
	        while true; do # a loop for hashcat selection menu
	            cd #your wordlists directory
	            echo "==========> Hashcat Runnning <==========" #used for brute-forcing the string formed hashes
	            echo "Menu:"
	            echo "1. Available wordlists"
	            echo "2. Run Hashcat"
                echo "3. Return to main menu"
	            read -p "-> " opinion
	            case "$opinion" in
		            1)
		                echo "Available wordlists: " #its better to put all files in one directory as txt files
		                echo "======================"
		                ls
		                read -p "Press any key to Return to main menu"
                        ;;
		            2)
		                echo "Starting hashcat..."
	                    read -p "Enter Hashmode number: " hashmode
	                    read -p "Enter wordlist name: " hashdir
	                    read -p "Enter the hash: " hashself
	                    hashcat -m $hashmode -a 0 $hashself $hashdir
	                    read -p "Press Any key to Procced to the main menu."
                        break # Exit the loop
	                    ;;
                    3)
                        echo "Exiting Hashcat..."
                        break
                        ;;
                esac
            done
            ;;

        exit)
             echo "Exiting the tool..."
             break  # Exit the loop
            ;;
    esac
done