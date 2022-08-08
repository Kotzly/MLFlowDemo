source .env

ssh-copy-id -i ./.ssh/id_rsa.pub $SFTP_USER@$SFTP_HOST
