# https://www.ibm.com/docs/en/sia?topic=kbaula-enabling-rsa-key-based-authentication-unix-linux-operating-systems-3
# https://kb.iu.edu/d/aews#:~:text=Your%20private%20key%20will%20be%20generated%20using%20the%20default%20filename,ssh%2Fmy_ssh_key%20).

rm -rf  ./.ssh*
mkdir -p ./.ssh

# Create keys for the host
ssh-keygen -t rsa -b 4096 -f ./.ssh/id_rsa < /dev/null

chmod 700 ./.ssh*
chmod 600 ./.ssh*/*pub

