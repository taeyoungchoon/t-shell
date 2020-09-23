server:
        yum install tftp-server -y
        # systemctl is-active tftp
        systemctl start tftp
        systemctl is-active tftp
        ls /var/lib/tftpboot
        echo 'this is foo' > /var/lib/tftpboot/foo

client:
        yum install tftp -y
        tftp localhost -v -c get foo

clean:
        yum remove tftp-server tftp -y
        rm -f /var/lib/tftpboot/foo
        rm -f foo
