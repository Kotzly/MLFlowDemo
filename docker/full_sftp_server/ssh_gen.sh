# https://www.ibm.com/docs/en/sia?topic=kbaula-enabling-rsa-key-based-authentication-unix-linux-operating-systems-3
# https://kb.iu.edu/d/aews#:~:text=Your%20private%20key%20will%20be%20generated%20using%20the%20default%20filename,ssh%2Fmy_ssh_key%20).

rm -rf  ./.ssh*

mkdir ./.ssh_sftp_server
mkdir ./.ssh_mlflow_server
mkdir ./.ssh_user

# Create keys for the host
ssh-keygen -t rsa -b 4096 -f ./.ssh_sftp_server/ssh_host_rsa_key < /dev/null
ssh-keygen -t ed25519 -f ./.ssh_sftp_server/ssh_host_ed25519_key < /dev/null

mkdir -p ~/.ssh
# Create keys for the client
if [ ! -f ~/.ssh/id_rsa ] && [! -f ~/.ssh/id_rsa.pub ] ; then
    echo "Creating keys for the client"
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N "" < /dev/null
    cp ~/.ssh/id_rsa.pub ./.ssh_user/id_rsa.pub
elif [ -f ~/.ssh/id_rsa.pub ] ; then
    echo "Keys for the client already exist. Copying the public key to the host"
    cp ~/.ssh/id_rsa.pub ./.ssh_user/id_rsa.pub
elif [ -f ~/.ssh/id_rsa ] ; then
    echo "Creating public key from private key for the client"
    ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh_user/id_rsa.pub
else
    echo "Error"
    exit
fi

ssh-keygen -t rsa -b 4096 -f ./.ssh_mlflow_server/id_rsa < /dev/null
cp ./.ssh_mlflow_server/id_rsa.pub ./.ssh_user/mlflow_id_rsa.pub

#echo "Host sftp
#    HostName sftp
#    IdentityFile /root/.ssh/id_rsa" > ./.ssh_user/config

# Change the ownership of the .ssh directory to the user.
chmod 700 ./.ssh*
chmod 600 ./.ssh*/*pub

#chmod 644 ./.ssh*/config

#cat ./.ssh_host/*.pub >> ./.ssh_user/authorized_keys

