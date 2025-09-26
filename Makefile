REPOSITORY=https://repo.anaconda.com/miniconda
INSTALLER=Miniconda3-py313_25.7.0-2-Linux-x86_64.sh
HASH=dda3629462ba1cfa72eb74535214c2e315c77f1cfb0f02046537e99f1bf64abc
HASHFILE=sha256sum.txt
PYENV=miniconda3
CONDA=$(PYENV)/bin/conda

.PHONY: checksum clean

$(PYENV)/bin/activate: checksum
	test -d $(PYENV) || bash ./$(INSTALLER) -b -p $(PYENV)
	$(CONDA) update conda -y
	$(CONDA) install pip wheel -y
	touch $(PYENV)/bin/activate

checksum: $(INSTALLER) $(HASHFILE)
	sha256sum -c $(HASHFILE)

$(INSTALLER):
	wget $(REPOSITORY)/$(INSTALLER)

$(HASHFILE):
	echo "$(HASH) $(INSTALLER)" > $(HASHFILE)

clean:
	rm -rf $(PYENV) $(HASHFILE) $(INSTALLER)
