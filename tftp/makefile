server:
        yum -y install tftp-server
        systemctl start tftp
        ls /var/lib/tftpboot
        echo 'this is foo' > /var/lib/tftpboot/foo

client:
        yum -y install tftp
        tftp localhost -v -c get foo

clean:
        yum -y remove tftp-server tftp
        rm -f /var/lib/tftpboot/foo
        rm -f foo
