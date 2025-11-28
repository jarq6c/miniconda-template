# Distributable Miniconda Environments

This template can be used as a starting point for building distributable Miniconda based packages. It includes a Makefile with targets necessary to build a reproducible Python virtual environment based on miniconda. To learn more about Miniconda see the [Miniconda Documentation](https://docs.conda.io/en/latest/miniconda.html).

## Build

```bash
$ make
```
Running `make` in this directory will retrieve and build the default environment specified in the Makefile. The chain of dependencies for the default target includes targets that retrieve a miniconda installation script for Linux and creates a stand-alone miniconda environment with the required dependencies. The name of the miniconda environment is `miniconda3` and can be activated as normal using `source miniconda3/bin/activate` and deactivated using `conda deactivate`. The default target includes an instruction to upgrade `conda`, and install `pip` and `wheel`.

Newer installations of miniconda now require explicit acceptance of Anaconda's [Terms of Service](https://www.anaconda.com/legal/terms/terms-of-service). Automatic acceptance of these terms is included as part of running `make`.

To start from scratch run clean:
```bash
$ make clean
```
