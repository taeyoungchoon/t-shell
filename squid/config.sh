cat squid.conf.orig | awk '/^#cache_dir/ { gsub(/#/, ""); $4 = 7000 }; { print }' > squid.conf.mod
