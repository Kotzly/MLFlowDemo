# Using local artifact storage

Here we present 2 ways to run the MLflow server. Note that there is a third way but that is not currently working.


## Using a local artifact storage

First, please input the artifact folder that you want to use at the SFTP server in the `.env` file.

```
MLFLOW_FOLDER= # Folder to save the artifacts at the SFTP server
```

Note that this folder must be accessible by both the python script and the mlflow container (needs to be mounted, in the same path).

Then:
```
sudo docker build . -t mlflow
cd local_file_storage
sudo docker-compose -f docker-compose-sftp.yml up
```

## Using a network SFTP artifact storage 

In this mode, you only need a SFTP server that already exists in your network.
First, set all the `local_sftp_server/.env` environment variables: 

```
MLFLOW_FOLDER= # Folder to save the artifacts at the SFTP server
SFTP_USER= # User to log in the SFTP server (same as SSH user)
SFTP_HOST= # SFTP/SSH host
SFTP_PORT= # SFTP/SSH port
```

Then run the following commands. Note that you will be prompted to enter the password to the SFTP server in the first time:

```bash
sudo docker build . -t mlflow # Builds the mlflow Image
cd local_sftp_server
bash ssh_gen.sh # Generate the mlflow container key pair
bash ssh_copy.sh # Copy the mlflow key to the SFTP host
sudo docker-compose up # Starts the MLflow container
bash add_host.sh # Adds the SFTP host to this machine's and MLflow container's known_hosts.
```

After doing this once, the next time you'll only need to run `docker-compose up`.


## Using the a containerized SFTP server

This mode is not working for now due to testing problems.
The SFTP server must be accessible by both MLflow server and MLflow client/user by using the same host and port.
This is difficult to test in my machine since the MLflow server is also containerized, and the `hostname` given to the SFTP server cannot be seen by the docker host machine :(.

The intended use is as shown:

Usage:
```bash
sudo docker build . -t mlflow
cd full_sftp_server
sh ssh_gen.sh
sudo docker-compose up
bash add_host.sh
```

Note that in this mode the is a ssh-key exchange by SFTP server, MLflow server, and MLflow user.
