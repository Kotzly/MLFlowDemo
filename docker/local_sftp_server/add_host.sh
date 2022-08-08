source .env
echo "HOST $SFTP_HOST"
echo "PORT $SFTP_PORT"
ssh-keyscan -p $SFTP_PORT $SFTP_HOST >> ~/.ssh/known_hosts
ssh-keyscan -p $SFTP_PORT $SFTP_HOST > ./.ssh/known_hosts
