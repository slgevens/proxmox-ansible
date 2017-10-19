top:; @date

Makefile:;

roles:; ansible-galaxy install -i -r requirements.yml
.PHONY: roles

once:; mkdir -p roles log 
