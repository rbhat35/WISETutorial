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

### Files Modified in This Generation of the Toolkit
This is the list of files I had to edit to support the new features in this generation of the toolkit.
1. [run.sh](./experiment/scripts/run.sh "run.sh file") -- This is script used to launch the experiments and is therefore where we start the stress test.
1. [start_stress_test.sh file](./microblog_bench/stress-test/stress_test_1_scripts/start_stress_test.sh "Stress Test Start Script") --  This file essentially configures the stress test.
1. [openstack_setup.sh file](./experiment/scripts/openstack_setup.sh "OpenStack Setup Script") -- This is where the public-facing IP is automatically assigned.
1. [plot_graphs.py](./vis/plot_graphs.py "Graph Plotting File") -- This is the script to generate all the graphs. Note, it is a standalone file, and does not take any arguments; so feel free to read in whatever you need to to plot whatever you want. Currently, it just generates a very vanilla set of plots (many of which can also be ploted by the .gnuplot scripts in the /vis folder)
1. [parse_results.sh](./experiment/parse_results.sh "Results parser") -- This file was created to automate the parsing and plotting of the data. Note, this file assumes that your results file is named `results.tar.gz` and is copied to `experiment` directory. Also, make sure to install all the [dependencies](./parsers/requirements.txt "Python Dependencies").
1. [mem.py](./parsers/mem.py "Memory Parser") -- This is where the memory parsing error was fixed.

### Configuring Noisy Neighbor Experiment
To simulate noisy neighbors, we run stress tests. You can stress whatever you want, as long as stress-ng supports it. To configure your test, simply edit the [start_stress_test.sh file](./microblog_bench/stress-test/stress_test_1_scripts/start_stress_test.sh "Stress Test Start Script"). You may also need to edit end_stress_test.sh, found in the same directory, based on what you're doing.
If you find yourself constrained by stress-ng, in theory, you could also edit the start_stress_test.sh and stop_stress_test.sh files so that they install some other stress test package, starts it up, and stop it.

### Other Things
* If you want to fork the repository and make changes, make sure to modify [run.sh](./experiment/scripts/run.sh "run.sh file") so that it clones the repository from your fork. Since we are cloning the repository inside this file without authentication, you'll probably need to make your copy of this repository public as well.