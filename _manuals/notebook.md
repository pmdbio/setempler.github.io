---
layout: manual
title:  "notebook"
---

A how-to use the jupyter (iPython) notebook (for Julia).

---

* TOC
{:toc}

---

## install

Install python's package manager `pip`.

```bash
# bash
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
pip install --user jupyter
```

Create an openssl certificate.

```bash
# bash
openssl req -x509 -nodes -days 365 -newkey rsa:1024 \
  -keyout jupyter.key -out jupyter.pem
```

Retrieve the sha1 by supplying a password to:

```python
# python
from notebook.auth import passwd
passwd()
```

Install the `julia` kernel (optional).

```
# julia
Pkg.add("IJulia")
Pkg.build("IJulia")
```

## run

Start the notebook.

```bash
# bash
jupyter notebook -ip hostname -port 8888 \
  --certfile jupyter.key --keyfile jupyter.key
```

Configuration can be stored in `~/.jupyter/jupyter_notebook_config.py`,
for example:

```python
c.NotebookApp.password = u'sha1:YOUR_SHA1_STRING_HERE'
c.NotebookApp.certfile = u'~/.ssl/jupyter.pem'
c.NotebookApp.keyfile = u'~/.ssl/jupyter.key'
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888
c.NotebookApp.notebook_dir = u'~/notebooks'
```

Then start the notebook.

```bash
# bash
jupyter notebook
```

## links

* [iJulia](https://github.com/JuliaLang/IJulia.jl)

