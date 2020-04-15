# WISETutorial

This project extends the capabilities of the [WISE Toolkit](https://github.com/coc-gatech-newelba/WISETutorial "Previous Generation Toolkit") to support a new class of experiments.

## Background & Tutorial
* An introduction to the WISE Toolkit & its uses can be found in [proposal.pdf](./proposal.pdf "Project Proposal"). Note, this toolkit was designed to support many of the experiments I proposed.
* A tutorial on how to run experiments & use the toolkit can be found [here](https://www.cc.gatech.edu/~ral3/tutorial2.html "Tutorial").
* The original toolkit can be found [here](https://github.com/coc-gatech-newelba/WISETutorial "Previous Generation Toolkit").

## Using this Toolkit
### Running Experiments
Simply follow Appendix A of the [tutorial](https://www.cc.gatech.edu/~ral3/tutorial2.html "Tutorial"). The steps where you allocate a public-facing IP via the OpenStack dashboard can be skipped since this has now been automated. 

To run a Noisy Neighbor experimet, in the [config file](./experiment/conf/config.sh "Experimental Config File"), add your stress testing machine(s). If you wish to run no stress-test, just leave replace `"<FILL IN>"` with `""`.

Note, also, that some of my scripts assume that you have an RSA `public key`/`private key` pair named `elba.pub`/`elba` that you use with your CloudLab account. Feel free to find-and-replace this out if necessary.

### Configuring Stress Test
