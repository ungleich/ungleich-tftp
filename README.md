![alt text](http://www.ungleich.ch/img/logo_200x200.svg "ungleich")

This is a really simple container that will expose its port 69/udp with a TFTP server listening on it.

# What is it?

The TFTP server will load the files located at the container's directory /var/lib/tftpboot, directory that is by default created as a volume. This allows the user to create the container, specifying any host directory to be mounted on the container. 

# How to use it?

A practical example is the following:

``` bash
docker run --name tftp -p 69:69/udp -v /some/path/to/share:/var/lib/tftpboot -d ungleich-tftp
```

# What does it do?
This will create the container with its name as "tftp", map the UDP 69 host's port to the container equivalent and mount any path to /var/lib/tftpboot, using the ungleich-tftp image