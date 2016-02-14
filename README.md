# aws-bootstrap

Using the following AWS credentials 
please provision a simple Node web application in a Docker container 
served by Nginx running on an EC2 instance provisioned by Ansible. 

The content served by the Node application can be anything. 
The container is to be hosted on a free Docker registry (ie. hub.docker.io or quay.io) and 
there are no restrictions on the number of git repositories that can be used. 

Please provide URLs, ELB or IP address where to access said application and URLs to all code repositories.


# Initial Setup 
To run the deployment you will need to setup your key From command line

   export AWS_ACCESS_KEY=xxx
 
   export AWS_SECRET_KEY=xxx

Next you run the deployment

    ansible-playbook ./create-multi-az

It will create a key, create a vpc,  a load balancer and an auto scaling group attached to the an image.

# Building an ec2 image

The build instructions for the image are copy the two config files from etc into the correct locations specified in bootstrap.sh
Also copy over the bootstrap.sh file and run it.  This will setup nginx as the reverse proxy and download the docker image 
Create a snapshot and put the new ID in the ansible file variable.

# The docker nodejs application image

Source: https://github.com/ozsynergy/docker-nodejs-word-app

Image: https://github.com/amirrajan/word-finder

NodeJs Application Source: https://github.com/amirrajan/word-finder

# Running the application

edit your /etc/hosts (assuming your pc is running linux) add the following
    <load balancer ip address> example.com
now you can use the word finder application
    http://example.com
    
    
