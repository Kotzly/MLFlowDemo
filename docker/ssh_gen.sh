# https://www.ibm.com/docs/en/sia?topic=kbaula-enabling-rsa-key-based-authentication-unix-linux-operating-systems-3
# https://kb.iu.edu/d/aews#:~:text=Your%20private%20key%20will%20be%20generated%20using%20the%20default%20filename,ssh%2Fmy_ssh_key%20).

rm -rf  ./.ssh*

mkdir ./.ssh_host
mkdir ./.ssh_user

# Create keys for the host
ssh-keygen -t rsa -b 4096 -f ./.ssh_host/ssh_host_rsa_key < /dev/null
ssh-keygen -t ed25519 -f ./.ssh_host/ssh_host_ed25519_key < /dev/null

# Create keys for the client
ssh-keygen -t rsa -b 4096 -f ./.ssh_user/id_rsa -N ""

#echo "Host sftp
#    HostName sftp
#    IdentityFile /root/.ssh/id_rsa" > ./.ssh_user/config

# Change the ownership of the .ssh directory to the user.
chmod 700 ./.ssh*
chmod 600 ./.ssh*/*pub

#chmod 644 ./.ssh*/config
