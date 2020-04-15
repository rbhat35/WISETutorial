# WISETutorial

This project extends the capabilities of the [WISE Toolkit](https://github.com/coc-gatech-newelba/WISETutorial "Previous Generation Toolkit") to support a new class of experiments.

## Background & Tutorial
* An introduction to the WISE Toolkit & its uses can be found in [proposal.pdf](./proposal.pdf "Project Proposal"). Note, this toolkit was designed to support many of the experiments I proposed.
* A tutorial on how to run experiments & use the toolkit can be found [here](https://www.cc.gatech.edu/~ral3/tutorial2.html "Tutorial").
* [Video](https://youtu.be/sZfsjAb-Rfo "Video Presentation") explaining the differences between this toolkit and the previous generation of the toolkit.

## Using this Toolkit
### Running Experiments
Simply follow Appendix A of the [tutorial](https://www.cc.gatech.edu/~ral3/tutorial2.html "Tutorial"). The steps where you allocate a public-facing IP via the OpenStack dashboard can be skipped since this has now been automated. 

To run a Noisy Neighbor experimet, in the [config file](./experiment/conf/config.sh "Experimental Config File"), add your stress testing machine(s). If you wish to run no stress-test, just leave replace `"<FILL IN>"` with `""`.

Note, also, that some of my scripts assume that you have an RSA `public key`/`private key` pair named `elba.pub`/`elba` that you use with your CloudLab account. Feel free to find-and-replace this out if necessary.

Make sure to install all the [dependencies](./parsers/requirements.txt "Python Dependencies") for the parsing and plotting scripts.

### Files Modified in This Generation of the Toolkit
This is the list of files I had to edit to support the new features in this generation of the toolkit. It's not exhaustive -- it just highlights some key changes/contributions.
1. [run.sh](./experiment/scripts/run.sh "run.sh file") -- This is script used to launch the experiments and is therefore where we start the stress test. The stress-test is started in  428-444 and stopped in 558-581.
1. [start_stress_test.sh file](./microblog_bench/stress-test/stress_test_1_scripts/start_stress_test.sh "Stress Test Start Script") --  This file essentially configures the stress test.
1. [openstack_setup.sh file](./experiment/scripts/openstack_setup.sh "OpenStack Setup Script") -- This is where the public-facing IP is automatically assigned and where the VMs on OpenStack are launched. My contribution is contained in lines 37-41.
1. [plot_graphs.py](./vis/plot_graphs.py "Graph Plotting File") -- This is my script to generate a bunch of  graphs. Note, it is a standalone file, and does not take any arguments; so feel free to read in whatever you need to to plot whatever you want. Currently, it just generates a very vanilla set of plots (many of which can also be ploted by the .gnuplot scripts in the /vis folder). However, I reccomend running this function only in the `parse_results.sh` since it depends on some folder creation that happens in this shell file.
1. [parse_results.sh](./experiment/parse_results.sh "Results parser") -- This file was created to automate the parsing and plotting of the data. Note, this file assumes that your results file is named `results.tar.gz` and is copied to `experiment` directory.
1. [mem.py](./parsers/mem.py "Memory Parser") -- This is where the memory parsing error was fixed. In the percentage function, we save more digits when we round (line 15).
1. [sample_data/ directory](./sample_data "Sample Data Dir") -- This folder contains sample data from two different experiments. The baseline experiment has no stress test running while the stress_test experiment does. View their respective results.tar.gz files and plots zip files.
1. [compare_plots.py file](./sample_data/compare_plots.py "Plot Comparison function") -- This file allows you to plot the results from two different experiments side-by-side.

### Configuring Noisy Neighbor Experiment
To simulate noisy neighbors, we run stress tests. You can stress whatever you want, as long as stress-ng supports it. To configure your test, simply edit the [start_stress_test.sh file](./microblog_bench/stress-test/stress_test_1_scripts/start_stress_test.sh "Stress Test Start Script"). You may also need to edit end_stress_test.sh, found in the same directory, based on what you're doing.
If you find yourself constrained by stress-ng, in theory, you could also edit the start_stress_test.sh and stop_stress_test.sh files so that they install some other stress test package, starts it up, and stop it.

### Other Things
* If you want to fork the repository and make changes, make sure to modify [run.sh](./experiment/scripts/run.sh "run.sh file") so that it clones the repository from your fork. Since we are cloning the repository inside this file without authentication, you'll probably need to make your copy of this repository public as well.
* If you want to run multiple different stress tests (e.g. one that stresses disk on one host, and one that stresses CPU on another), you can start by retracing my modifications in [run.sh](./experiment/scripts/run.sh "run.sh file") at the lines I mentioned.
* Feel free to reach out to me if there are any issues.