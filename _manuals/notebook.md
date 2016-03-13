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

```bash
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
pip install --user jupyter
```

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout jupyter.key -out jupyter.pem
```

```julia
Pkg.add("IJulia")
Pkg.build("IJulia")
```

## run

```bash
jupyter notebook -ip hostname -port 8888 --certfile jupyter.key --keyfile jupyter.key
```

## links

* [iJulia](https://github.com/JuliaLang/IJulia.jl)
