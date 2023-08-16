_ulimit=$(ulimit -n)
echo "ulimit -n: $_ulimit"
if [ $_ulimit -lt 65535 ]; then
    echo "fs.file-max = 65535" >> /etc/sysctl.conf
    sysctl -p
    echo "* soft     nproc          65535" >> /etc/security/limits.conf
    echo "* hard     nproc          65535" >> /etc/security/limits.conf
    echo "* soft     nofile          65535" >> /etc/security/limits.conf
    echo "* hard     nofile          65535" >> /etc/security/limits.conf
    echo "root soft     nproc          65535" >> /etc/security/limits.conf
    echo "root hard     nproc          65535" >> /etc/security/limits.conf
    echo "root soft     nofile          65535" >> /etc/security/limits.conf
    echo "root hard     nofile          65535" >> /etc/security/limits.conf
    echo "session required pam_limits.so" >> /etc/pam.d/common-session
fi