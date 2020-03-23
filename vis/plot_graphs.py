import matplotlib.pyplot as plt

def cpu():
    plt.title("CPU")
    plt.xlabel("Time (seconds)")
    plt.ylabel("CPU utilization (%)")
    plt.plot([1,2], [2,3])
    plt.show()

cpu()