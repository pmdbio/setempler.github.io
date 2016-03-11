---
layout: manual
title:  "notebook"
---

## install

```bash
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
pip install --user jupyter
```

## run

```julia
Pkg.add("IJulia")
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout jupyter.key -out jupyter.pem
Pkg.build("IJulia")
```

```bash
jupyter notebook -ip hostname -port 8888 --certfile jupyter.key --keyfile jupyter.key
```

## links

[iJulia](https://github.com/JuliaLang/IJulia.jl)
