#!/bin/bash
# shellcandy v1 - 2024
# written by: m0shi
# sys admin tools
# github: github.com/al3fbet
# portfolio: https://m0shi.xyz
# blog: https://blog.m0shi.xyz





echo -e "\n\e[00;31m#########################################################\e[00m"
echo -e "\e[00;31m#\e[00m" "\e[00;33mLog generator and encrypter\e[00m" "\e[00;31m#\e[00m"
echo -e "\e[00;31m#########################################################\e[00m"
echo -e "\e[00;33m# www.m0shi.xyz | @m0shi \e[00m"
echo -e "\e[00;33m# $version\e[00m"
echo -e "\e[00;33m# Example: ./bakups.sh  \e[00m\n"
echo ''
echo "Running startup shell script..."
echo "Let's try and get some work done today"
echo "*** LETS GET THE DAY STARTED ***"
echo '(•_•)'
echo '( •_•)>⌐■-■'
echo '(⌐■_■)'
sleep 2
clear
echo "Locating and grabbing ip address"
echo ''
echo "Your ip address is:"
curl ipinfo.io/ip
#		determining public IP adress
#		see:	https://stackoverflow.com/questions/14594151/methods-to-detect-public-ip-address-in-bash#14594304
echo ""
#		inserting a linke break
	fqn=$(host -TtA $(hostname -s)|grep "has address"|awk '{print $1}') ; \
	if [[ "${fqn}" == "" ]] ; then fqn=$(hostname -s) ; fi ; \
	echo "${fqn}"
sleep 2
clear
#		Find the FQDN of the machine.
#		see:	https://serverfault.com/questions/367141/how-to-get-the-fully-qualified-name-fqn-on-unix-in-a-bash-script/367682#367682

echo ""
echo "Downloading updates and upgrades"
sudo apt-get update && sudo apt-get upgrade -y
echo ""
echo "Updating completed..."
echo "Clearing bash history"
cat /dev/null > .bash_history
echo "bash history cleared"
echo ""
echo "Checking System Resources"
cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}')
memory_usage=$(free -m | awk '/Mem/ {print $3}')
echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $memory_usage MB"
echo ""
echo "Backing up /var/log directory"
backup_dir="/path/to/backup/"
source_dir="/path/to/source"
timestamp=$(date +%Y%m%d%H%M%S)
backup_folder="backup_$timestamp"
backup_file="$backup_folder.tar.gz"
checksum_file="checksum_$timestamp.sha256"

echo "Creating backup folder"
mkdir -p "$backup_dir/$backup_folder"

echo "Compressing backup into .tar.gz"
tar -czf "$backup_dir/$backup_folder/$backup_file" -C "$source_dir" .

echo "Backing up and saving files sha256-checksum"
# Calculate checksum and save to file
sha256sum "$backup_dir/$backup_folder/$backup_file" > "$backup_dir/$backup_folder/$checksum_file"

echo "Encrypting the backup file for extra security"
# Encrypt the backup file
gpg --output "$backup_dir/$backup_folder/$backup_file.gpg" --symmetric "$backup_dir/$backup_folder/$backup_file"
echo "Saving file in $backup_dir/$backup_folder/"
echo "Deleting .tar.gz file and keeping .gpg file..."
rm "$backup_dir/$backup_folder/$backup_file"
echo "File deleted"
echo ""
echo "Checking backup folder"
echo "-------------------------------------------"
echo "orion@x100:~/brain/scripts/shellcandy$ ls -alF /home/orion/archive/2024"
ls -alF /home/jebby/archive/2024
echo ""
echo "Everything looks good...."
echo ""
echo "Checking folder and listing contents now"
echo ""
echo "jebby@x12300:~/scripts/shellcandy$ ls -alF /home/orion/archive/2024/$backup_folder"
ls -alF "$backup_dir/$backup_folder"
