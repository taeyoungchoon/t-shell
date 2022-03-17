Things to check before the first use
------------------------------------
 * Set your login name and full name in `preseed.cfg`, update your GitHub name
   in `install.sh` in order to install your SSH key for authentication by guest.
   If you want to use different SSH key, not the one from GitHub, just put
   `authorized_keys` to `preseed` directory and remove `wget` command that
   fetches key from GitHub.
   Update your login name in `postinst.sh`, where SSH key is installed.
 * It's worth considering to enable password authentication in `preseed.cfg`
   at least during first run so you could `virsh console <GUEST_NAME>` in case
   network connection in guest does not comes up with DHCP or IP of the guest
   is unclear.
 * Check RAM size and disk size for the guest in arguments to `virst-install` in
   `install.sh` and modify them if needed.
 * Add `apt-get install <your_favorite>` or whatever you want to `postinst.sh`
   and any configuration files you want to add to the guest into `postinst`
   directory.

Network configuration
---------------------
Script works best with bridged network, when guests are able to use DHCP
server. In case you want something else, replace `br0` in arguments to
virt-install in `install.sh`.

Example of network configuration in `/etc/network/interfaces`:
```
auto lo
iface lo inet loopback

auto eth0 # replace eth0 with your actual interface name
iface eth0 inet manual

auto br0
iface br0 inet dhcp
        bridge_ports eth0
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
```

More Info
---------
* https://www.debian.org/releases/stable/example-preseed.txt
