Ensemble des documents et projets relatifs à l'ENSEEIHT.

# Cloning project with submodules
```
    git clone --recursive https://github.com/voblivion/ENSEEIHT.git
```

# Working with submodules

## Pulling in Upstream changes
In submodule directory :
```
    git fetch
    git rebase
```
In main directory :
```
    git submodule update --remode <submodule-name>
```

