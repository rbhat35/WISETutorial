# If using bare metal hosts, set with your CloudLab username.
# If using virtual machines (appendix A of the tutorial), set with "ubuntu".
readonly USERNAME="ubuntu"

# If using bare metal hosts, set with "physical".
# If using virtual machines (appendix A of the tutorial), set with "vm".
readonly HOSTS_TYPE="vm"

# If using profile MicroblogBareMetalD430, set with "d430".
# If using profile MicroblogBareMetalC8220, set with "c8220".
readonly HARDWARE_TYPE="c8220"

# Maximum length to which the queue of pending connections of a socket may grow.
SOMAXCONN=64

# Number of CPU cores to use.
CPUCORES=4

# Hostnames of each tier.
# Example (bare metal host): pc853.emulab.net
# Example (virtual machine): 10.254.3.128
readonly WEB_HOSTS="10.254.2.33"
readonly POSTGRESQL_HOST="10.254.3.193"
readonly WORKER_HOSTS="10.254.1.248"
readonly MICROBLOG_HOSTS="10.254.0.173"
readonly MICROBLOG_PORT=9090
readonly AUTH_HOSTS="10.254.3.60"
readonly AUTH_PORT=9091
readonly INBOX_HOSTS="10.254.0.98"
readonly INBOX_PORT=9092
readonly QUEUE_HOSTS="10.254.0.184"
readonly QUEUE_PORT=9093
readonly SUB_HOSTS="10.254.3.241"
readonly SUB_PORT=9094
readonly CLIENT_HOSTS="10.254.0.52"

# Hostname of stress-testing nodes
readonly STRESS_TEST_1="10.254.0.159"
readonly STRESS_TEST_2="clnode016.clemson.cloudlab.us"
readonly STRESS_TEST_3="clnode016.clemson.cloudlab.us"

# Apache/mod_wsgi configuration.
readonly APACHE_PROCESSES=8
readonly APACHE_THREADSPERPROCESS=4

# Postgres configuration.
readonly POSTGRES_MAXCONNECTIONS=100

# Workers configuration.
readonly NUM_WORKERS=32

# Microservices configuration.
AUTH_THREADPOOLSIZE=32
INBOX_THREADPOOLSIZE=32
QUEUE_THREADPOOLSIZE=32
SUB_THREADPOOLSIZE=32
MICROBLOG_THREADPOOLSIZE=32

# Either 0 or 1.
readonly WISE_DEBUG=0
