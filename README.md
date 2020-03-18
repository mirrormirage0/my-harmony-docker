# How to setup local harmony openstaking docker container (with pre-generated bls keys)

# Pre-requisites
1. Must have Docker CE installed, up and running. If you are not able to run `docker run hello-world`, you are not good to go!
2. You have already created bls keys and placed in a local folder keys/

## Steps

## Clone the git directory to your local folder
`git clone https://github.com/mirrormirage0/my-harmony-docker.git`

## Navigate to cloned folder
`cd my-harmoney-docker`

### Ensure .key files are available in keys/ folder

### Build the docker image
`docker image build -t openstaking:1.0 .`

### Create a local folder named openstaking 
`mkdir openstaking`

### Run the container
`docker run -it --rm -d --name openstaking -v "$(pwd)"/openstaking:/openstaking openstaking:1.0`

### Connect to the running container
`docker exec -it openstaking /bin/zsh`
