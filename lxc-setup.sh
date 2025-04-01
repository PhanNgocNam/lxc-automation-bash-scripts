if [ -z "$1" ]
then
    echo "Username is required, ./lxc-setup.sh <username>"
    exit 1
fi
echo "Setting up LXC container for user: $1"

echo "Add user ############################################"
adduser $1

#echo "Change password for user $1 ###########################"
#passwd $1

echo "Grant sudo permissions for $1 #########################"
cd /etc/sudoers.d && touch $1 && echo "$1 ALL=(ALL) NOPASSWD:ALL" >> $1

echo "Add ssh public key for $1 #############################"
mkdir -p /home/$1/.ssh
touch /home/$1/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAvHqRmVP5IX7wivyWC1SXlr/cEe3nq3fDDFNHpRrh1P p2n@PhanNgocNams-MacBook-Air.local" >> /home/$1/.ssh/authorized_keys

echo "Install net-tools #####################################"
apt install -y net-tools >> /dev/null

echo "Done!"