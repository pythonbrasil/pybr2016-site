# PythonBrasil[12]

Esse é o portal oficial da Python Brasil 12, criado de maneira colaborativa.


## Contribuições

Se você tem interesse de contribuir com o site faça o clone do repositório da seguinte forma:

```
$ git clone git@github.com:pythonbrasil/pythonbrasil12-site.git
```

Em seguida instale todas as dependências:

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

Junto com o repositório existe um playbok para ansible que suporta as distribuições GNU/Linux RedHat-Like e Debian-Like. Para utilizar o playbook do ansible utilize os seguintes comandos:

```
$ sudo yum install ansible
$ make ansible-setup
```

### Compilando o Site

Após a criação do ambiente (manualmente ou via ansible), para compilar o site execute o seguinte comando:
```
$ workon pybr12-site
$ make html serve
```

Em seguida acesse pelo navegador a URL http://localhost:8000
