# more
for user in $(grep USER /var/spool/at/a* | cut -d';' -f 1 | cut -d'=' -f 2); do
    echo "${user}";
done
