![alt text](http://www.ungleich.ch/img/logo_200x200.svg "ungleich")

This is a really simple container that will expose its port 69/udp with a TFTP server listening on it.

# What is it?

The TFTP server will load the files located at the container's directory /var/lib/tftpboot, which is by default created as a volume.

By default, there is a file available named **pxelinux.0**, which is an iPXE image built with a embedded script, making it to "chainload" to a HTTP server. The hostname of the HTTP server to contact can be specified when the container is run, passing the environment variable "HTTP_SERVER".

Also, if you don't want to use this default image but other files instead, you can specify any host directory to be mounted on the container, using the option '-v', which bind mounts a volume to the container. 

# How to use it?

A practical example is the following:

``` bash
docker run --name tftp -e HTTP_SERVER=example.com -d ungleich/ungleich-tftp
```
If any host contacts this TFTP server, it will then be forwarded to "example.com" immediatly after booting the iPXE image.

You can also use any file(s) you want, rather than the default image:

``` bash
docker run --name tftp -v /some/path/to/share:/var/lib/tftpboot -d ungleich/ungleich-tftp
```

# Caveats

1. Default value for HTTP_SERVER is http-server
2. By default, when your host contacts to the HTTP server, it will try to download the file **pxelinux.0**. This might be improved soon, so the filename can also be specified.
