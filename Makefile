REPOSITORY=https://repo.anaconda.com/miniconda
INSTALLER=Miniconda3-py312_24.3.0-0-Linux-x86_64.sh
HASH=96a44849ff17e960eeb8877ecd9055246381c4d4f2d031263b63fa7e2e930af1
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
