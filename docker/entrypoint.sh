echo "Starting MLflow server"
echo "Using postgres database: postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST/$POSTGRES_DB"
echo "Using artifact root: sftp://$SFTP_USER@$SFTP_HOST:$SFTP_PORT$MLFLOW_FOLDER"

ssh-keyscan -p $SFTP_PORT -H $SFTP_HOST >> ~/.ssh/known_hosts

mlflow server \
    --backend-store-uri postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST/$POSTGRES_DB \
    --default-artifact-root sftp://$SFTP_USER@$SFTP_HOST:$SFTP_PORT/data/mlflow \
    -p 5000 \
    -h 0.0.0.0

