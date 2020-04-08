# Change to the parent directory.
cd "$(dirname "$(dirname "$(readlink -fm "$0")")")"

# Stop Stress Test 1.
xargs kill < pid
rm pid

# If previous method didn't work, this will definitely kill it
killall stress-ng