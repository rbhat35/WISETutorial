# Create and unzip results tar into analysis folder
mkdir -p analysis
rm -rf analysis/*
tar -xzf results.tar.gz -C analysis

# Uncompress the log files collected from the client server
mkdir -p analysis/client
tar -xzf analysis/log-client*.tar.gz -C analysis/client
# Uncompress the log files collected from the database server
mkdir -p analysis/db
tar -xzf analysis/log-db*.tar.gz -C analysis/db
# Uncompress the log files collected from the authentication server
mkdir -p analysis/auth
tar -xzf analysis/log-auth*.tar.gz -C analysis/auth
# Uncompress the log files collected from the inbox server
mkdir -p analysis/inbox
tar -xzf analysis/log-inbox*.tar.gz -C analysis/inbox
# Uncompress the log files collected from the microblog server
mkdir -p analysis/microblog
tar -xzf analysis/log-microblog*.tar.gz -C analysis/microblog
# Uncompress the log files collected from the queue server
mkdir -p analysis/queue
tar -xzf analysis/log-queue*.tar.gz -C analysis/queue
# Uncompress the log files collected from the subscription server
mkdir -p analysis/sub
tar -xzf analysis/log-sub*.tar.gz -C analysis/sub


############
# Move up a directory to start running parsers
cd ../


# Parse CPU utilization logs collected from the database server
cpu_fn=`ls experiment/analysis/db/*.cpu`
python parsers/cpu.py $cpu_fn
# Parse memory utilization logs collected from the database server
mem_fn=`ls experiment/analysis/db/*.tab`
python parsers/mem.py $mem_fn
# Parse disk utilization logs collected from the database server
disk_fn=`ls experiment/analysis/db/*.dsk`
python parsers/disk.py $disk_fn


# Calculate the number of requests per second
python parsers/requests_per_sec.py 80 experiment/analysis/client
# Calculate the response time distribution
python parsers/rt_dist.py 80 experiment/analysis/client
# Calculate the point-in-time response time
python parsers/rt_pit.py 80 experiment/analysis/client
# Calculate the queue length in the database server
python parsers/queue_length.py 5432 experiment/analysis/auth/ experiment/analysis/inbox/ experiment/analysis/queue/ experiment/analysis/sub/ experiment/analysis/microblog/

mkdir -p vis/data
rm -rf vis/data/*
mv *.data vis/data