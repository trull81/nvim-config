.PHONY: install install_submodule update update_submodule pathogen uninstall

install: autoload pathogen install_submodule
update: pull pathogen update_submodule

pathogen: autoload
	curl -LSso autoload/pathogen.vim https://tpo.pe/pathogen.vim

install_submodule:
	git submodule update --recursive --init

update_submodule:
	git submodule update --recursive

autoload:
	mkdir autoload

pull:
	git pull origin master

pull_submodules:
	git submodule foreach 'git fetch && git reset --hard origin/HEAD'
