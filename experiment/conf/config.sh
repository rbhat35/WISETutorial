# If using bare metal hosts, set with your CloudLab username.
# If using virtual machines, set with "ubuntu".
readonly USERNAME="<FILL IN>"

# If using bare metal hosts, set with "physical".
# If using virtual machines, set with "vm".
readonly HOSTS_TYPE="<FILL IN>"

# Hostnames of each tier.
readonly CLIENT_HOSTS="<FILL IN>"
readonly WEB_HOSTS="<FILL IN>"
readonly POSTGRESQL_HOST="<FILL IN>"
readonly WORKER_HOSTS="<FILL IN>"
readonly MICROBLOG_HOSTS="<FILL IN>"
readonly MICROBLOG_PORT=9090
readonly AUTH_HOSTS="<FILL IN>"
readonly AUTH_PORT=9091
readonly INBOX_HOSTS="<FILL IN>"
readonly INBOX_PORT=9092
readonly QUEUE_HOSTS="<FILL IN>"
readonly QUEUE_PORT=9093
readonly SUB_HOSTS="<FILL IN>"
readonly SUB_PORT=9094

# Apache/mod_wsgi configuration.
readonly APACHE_PROCESSES="<FILL IN>"
readonly APACHE_THREADSPERPROCESS="<FILL IN>"

# Postgres configuration.
readonly POSTGRES_MAXCONNECTIONS="<FILL IN>"

# Workers configuration.
readonly NUM_WORKERS="<FILL IN>"

# Microservices configuration.
AUTH_THREADPOOLSIZE="<FILL IN>"
INBOX_THREADPOOLSIZE="<FILL IN>"
QUEUE_THREADPOOLSIZE="<FILL IN>"
SUB_THREADPOOLSIZE="<FILL IN>"
MICROBLOG_THREADPOOLSIZE="<FILL IN>"

# Either 0 or 1.
readonly WISE_DEBUG=0
