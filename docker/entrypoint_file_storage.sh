echo "Starting MLflow server"
echo "Using postgres database: postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST/$POSTGRES_DB"
echo "Using artifact root: file:/$MLFLOW_FOLDER"

mlflow server \
    --backend-store-uri postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST/$POSTGRES_DB \
    --default-artifact-root file:$MLFLOW_FOLDER \
    -p 5001 \
    -h 0.0.0.0