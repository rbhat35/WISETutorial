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


# Make empty dir for data files and plots
mkdir -p vis/data
rm -rf vis/data/*
mkdir -p vis/plots
rm -rf vis/plots/*

# save .data files for each service in appropriate place
for service in "auth" "client" "db" "inbox" "microblog" "queue" "sub"; do
    # Parse CPU utilization logs collected from the database server
    cpu_fn=`ls experiment/analysis/$service/*.cpu`
    python3 parsers/cpu.py $cpu_fn
    # Parse memory utilization logs collected from the database server
    mem_fn=`ls experiment/analysis/$service/*.tab`
    python3 parsers/mem.py $mem_fn
    # Parse disk utilization logs collected from the database server
    disk_fn=`ls experiment/analysis/$service/*.dsk`
    python3 parsers/disk.py $disk_fn

    # Make empty subfolders for service's data and plots
    mkdir -p vis/data/$service
    mkdir -p vis/plots/$service
    rm -rf vis/data/$service/*
    rm -rf vis/plots/$service/*

    # Move all results into the appropriate subfolder within vis/data folder
    mv *.data vis/data/$service
done 

# Calculate the number of requests per second
python3 parsers/requests_per_sec.py 80 experiment/analysis/client
# Calculate the response time distribution
python3 parsers/rt_dist.py 80 experiment/analysis/client
# Calculate the point-in-time response time
python3 parsers/rt_pit.py 80 experiment/analysis/client
# Calculate the queue length in the database server
python3 parsers/queue_length.py 5432 experiment/analysis/auth/ experiment/analysis/inbox/ experiment/analysis/queue/ experiment/analysis/sub/ experiment/analysis/microblog/

# move all the network results into main data folder
mv *.data vis/data

# Generate plots from the data
python3 vis/plot_graphs.py 