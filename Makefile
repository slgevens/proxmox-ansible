top:; @date

Makefile:;

# get various ansible versions

base := ~/usr/ext
version := devel
version := stable-2.2

stables  := 1.9 2.0 2.1 2.2
versions := $(stables:%=stable-%) devel

url := git://github.com/ansible/ansible.git

clone = (cd $(base); git clone --branch $(version) --recursive $(url) ansible-$(version))
pull  = (cd $(base)/ansible-$(version); git pull --rebase; git submodule update --init --recursive)
setup = source $(base)/ansible-$(version)/hacking/env-setup -q
pkgs  = sudo aptitude install python-netaddr

help:
	@$(foreach version,$(versions),echo '$(clone)';)
	@$(foreach version,$(versions),echo '$(pull)';)
	@$(foreach version,$(versions),echo '$(setup)';)
	@echo
	@echo 'source <(< ~/.gpg-agent-info xargs -i echo export {})'

clone pull setup pkgs:; @echo '$($@)'

roles:; ansible-galaxy install -i -r requirements.yml
.PHONY: roles

tde := git config push.default simple;
tde += git config user.email t.delamare@epiconcept.fr
tde:; $($@)

wato:; git push --dry-run wato

once:; mkdir -p roles log 

README.html: README.md; pandoc -o $@ $<
readme: README.html

DRY  := -C
VERB :=

templates:; ./templates.yml $(DRY) $(VERB)
.PHONY: templates

vartar := run v v1 v2

run    := DRY  :=
v      := VERB := -v
v2     := VERB := -vv
v3     := VERB := -vvv

$(vartar):; @: '$($@)' $(eval $($@))
