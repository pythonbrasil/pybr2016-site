# **PythonBrasil[12] . Site Oficial**

[![Build Status](https://travis-ci.org/pythonbrasil/pythonbrasil12-site.svg?branch=master)](https://travis-ci.org/pythonbrasil/pythonbrasil12-site)

Esse é o portal oficial da Python Brasil 12, criado de maneira colaborativa.


## **Contribuições**

Se você tem interesse de contribuir com o site faça o clone do repositório da seguinte forma:

```
$ git clone git@github.com:pythonbrasil/pythonbrasil12-site.git
```


### **Executando com docker-compose, the fast-way**

Se você possuir [Docker Compose](https://docs.docker.com/compose/install/) instalado em seu ambiente, este é o caminho mais rápido para o site rodar em sua máquina.

Dentro da pasta do projeto, execute o seguinte comando:

```
$ docker-compose up
```

Em seguida acesse pelo navegador a URL [http://localhost:8000](http://localhost:8000).


### **Instalação manual, the long-,detailed-way**

Caso prefira a instalação e execução manual do site, os passos seguintes descrevem a instalação de dependências e execução.


#### **Instalando todas as dependências**

```
With Yum:
$ sudo yum install python-virtualenvwrapper libxslt-devel libxml2-devel rubygem-sass nodejs npm

With apt-get:
$ sudo apt-get install libxml2-dev libxslt1-dev python-dev nodejs npm
$ sudo pip install virtualenvwrapper

$ cd pythonbrasil12-site
$ npm install gulp gulp-uglify gulp-concat
$ export WORKON_HOME="~/venv"
$ . /usr/bin/virtualenvwrapper.sh
# OR
$ . /usr/local/bin/virtualenvwrapper.sh
$ mkvirtualenv pybr12-site
$ workon pybr12-site && pip install -r requirements.txt
```

#### **Utilizando Ansible**
Junto com o repositório existe um playbook para ansible que suporta as distribuições GNU/Linux RedHat-Like e Debian-Like.

Para utilizar o playbook do ansible utilize os seguintes comandos:

```
$ sudo yum install ansible
$ make ansible-setup
```

#### **Compilando o Site**

Após a criação do ambiente (manualmente ou via ansible), para compilar o site execute o seguinte comando:
```
$ workon pybr12-site
$ make html serve
```

Em seguida acesse pelo navegador a URL [http://localhost:8000](http://localhost:8000).
