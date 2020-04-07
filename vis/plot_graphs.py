import matplotlib.pyplot as plt

DATA_ROOT_DIR = "/Users/raghavbhat/Code/WISETutorial/vis/data/"
PLOT_SAVE_LOCATION = "/Users/raghavbhat/Code/WISETutorial/vis/plots/"

def cpu(serviceName):
    plt.clf()
    plt.plotfile(fname = DATA_ROOT_DIR + serviceName + "/" + "cpu0.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="CPU 0")
    plt.plotfile(fname = DATA_ROOT_DIR + serviceName + "/" + "cpu1.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="CPU 1")
    plt.plotfile(fname = DATA_ROOT_DIR + serviceName + "/" + "cpu2.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="CPU 2")   
    plt.title("CPU")
    plt.xlabel("Time (seconds)")
    plt.ylabel("CPU utilization (%)")
    plt.legend()
    plt.grid()
    plt.savefig(PLOT_SAVE_LOCATION + serviceName + "/" + "cpu")

def disk(serviceName):
    plt.clf()
    plt.plotfile(fname = DATA_ROOT_DIR + serviceName + "/" + "diskread.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="Read")
    plt.plotfile(fname = DATA_ROOT_DIR + serviceName + "/" + "diskwrite.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="Write") 
    plt.title("Disk")
    plt.xlabel("Time (seconds)")
    plt.ylabel("Disk I/O (in kB)")
    plt.legend()
    plt.grid()
    plt.savefig(PLOT_SAVE_LOCATION + serviceName + "/" + "disk")

def mem(serviceName):
    plt.clf()
    plt.plotfile(fname = DATA_ROOT_DIR + serviceName + "/" + "mem.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="Memory")
    plt.title("Memory")
    plt.xlabel("Time (seconds)")
    plt.ylabel("Memory utilization (%)")
    plt.legend()
    plt.grid()
    plt.savefig(PLOT_SAVE_LOCATION + serviceName + "/" + "mem")

def queue_length():
    plt.clf()
    plt.plotfile(fname = DATA_ROOT_DIR + "queue_length.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="Items")
    plt.title("Queue Length")
    plt.xlabel("Time (milliseconds)")
    plt.ylabel("Queue Length")
    plt.legend()
    plt.grid()
    plt.savefig(PLOT_SAVE_LOCATION + "queue_length")

def requests_per_sec():
    plt.clf()
    plt.plotfile(fname = DATA_ROOT_DIR + "requests_per_sec.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="Requests")
    plt.title("Requests per Second")
    plt.xlabel("Time (seconds)")
    plt.ylabel("# Requests")
    plt.legend()
    plt.grid()
    plt.savefig(PLOT_SAVE_LOCATION + "reqs_per_sec")

def response_time_distribution():
    plt.clf()
    plt.plotfile(fname = DATA_ROOT_DIR + "rt_dist.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="# Requests")
    plt.title("Response Time Distribution")
    plt.xlabel("Response Time (milliseconds)")
    plt.ylabel("# Requests")
    plt.xlim((-30, 3000))
    plt.yscale(value='log')
    plt.legend()
    plt.grid()
    plt.savefig(PLOT_SAVE_LOCATION + "response_time_distribution")

def point_in_time_distribution():
    plt.clf()
    plt.plotfile(fname = DATA_ROOT_DIR + "rt_pit.data", cols=(0,1), skiprows=0, delimiter=" ", newfig=False, label="PIT Response Time")
    plt.title("Point in Time Distribution")
    plt.xlabel("Time (milliseconds)")
    plt.ylabel("PIT Response Time (milliseconds)")
    plt.legend()
    plt.grid()
    plt.savefig(PLOT_SAVE_LOCATION + "point_in_time_distribution")

for serviceName in ["auth", "client", "db", "inbox", "microblog", "queue", "sub", "stress-test-1"]:
    cpu(serviceName)
    disk(serviceName)
    mem(serviceName)

queue_length()
requests_per_sec()
response_time_distribution()
point_in_time_distribution()