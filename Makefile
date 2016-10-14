PY?=python
PELICAN?=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

GITHUB_PAGES_BRANCH=gh-pages

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

help:
	@echo 'Makefile for a pelican Web site                                            '
	@echo '                                                                           '
	@echo 'Usage:                                                                     '
	@echo '   make theme                          (re)generate the theme files        '
	@echo '   make html                           (re)generate the web site           '
	@echo '   make clean                          remove the generated files          '
	@echo '   make clean-theme                    remove the generated files for theme'
	@echo '   make regenerate                     regenerate files upon modification  '
	@echo '   make publish                        generate using production settings  '
	@echo '   make serve [PORT=8000]              serve site at http://localhost:8000 '
	@echo '   make serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80     '
	@echo '   make devserver [PORT=8000]          start/restart develop_server.sh     '
	@echo '   make stopserver                     stop local server                   '
	@echo '   make github                         upload the web site via gh-pages    '
	@echo '   make ansible-setup                  build environment with ansible      '
	@echo '                                                                           '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html    '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                     '
	@echo '                                                                           '

theme:
	cd theme; make all

html: theme
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

clean-theme:
	cd theme; make clean

clean: clean-theme
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
ifdef PORT
	cd $(OUTPUTDIR) && $(PY) -m pelican.server $(PORT)
else
	cd $(OUTPUTDIR) && $(PY) -m pelican.server
endif

serve-global:
ifdef SERVER
	cd $(OUTPUTDIR) && $(PY) -m pelican.server 80 $(SERVER)
else
	cd $(OUTPUTDIR) && $(PY) -m pelican.server 80 0.0.0.0
endif


devserver:
ifdef PORT
	$(BASEDIR)/develop_server.sh restart $(PORT)
else
	$(BASEDIR)/develop_server.sh restart
endif

stopserver:
	$(BASEDIR)/develop_server.sh stop
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

publish: theme
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

github: publish
	ghp-import -m "Generate Pelican site" -b $(GITHUB_PAGES_BRANCH) $(OUTPUTDIR)
	git push origin $(GITHUB_PAGES_BRANCH)

ping:
	curl -Is http://www.google.com/webmasters/tools/ping?sitemap=http://2016.pythonbrasil.org.br/sitemap.xml | grep "200 OK" || echo "Erro pinging Google"
	curl -Is http://www.bing.com/webmaster/ping.aspx?siteMap=http://2016.pythonbrasil.org.br/sitemap.xml | grep "200 OK" || echo "Erro pinging Bing"

ansible-setup:
	ansible-playbook ansible/setup.yml -K

.PHONY: theme html help clean clean-theme regenerate serve serve-global devserver publish github ansible-setup
