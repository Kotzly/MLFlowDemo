echo "Starting MLflow server"
echo "Using postgres database: postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST/$POSTGRES_DB"
echo "Using artifact root: sftp://$SFTP_USER@$SFTP_HOST:$SFTP_PORT$MLFLOW_FOLDER"

ssh-keyscan -p 22 -H sftp >> ~/.ssh/known_hosts

mlflow server \
    --backend-store-uri postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST/$POSTGRES_DB \
    --default-artifact-root sftp://$SFTP_USER@$SFTP_HOST:$SFTP_PORT$MLFLOW_FOLDER \
    -p 5000 \
    -h 0.0.0.0

