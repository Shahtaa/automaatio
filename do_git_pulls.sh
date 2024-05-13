#!/bin/bash

# Näytä nykyisen kansion sisältö
ls

# Haluttu sijainti, johon vaihdetaan
haluttu_sijainti="$HOME/Documents/automaatio"

# Vaihda aktiiviseen kansioon
echo "Vaihdetaan aktiiviseen kansioon: $haluttu_sijainti"
cd "$haluttu_sijainti" || exit

# Kohdekansion nimi
kohdekansio="kohdekansio"

# Tarkista, onko kohdekansio olemassa ja poista sen sisältö tarvittaessa
if [ -d "$kohdekansio" ]; then
    echo "Kohdekansio $kohdekansio on jo olemassa, tyhjennetään sen sisältö."
    rm -rf "$kohdekansio"/*
else
    echo "Kohdekansiota $kohdekansio ei ole olemassa, luodaan se."
    mkdir "$kohdekansio" || exit
fi

# Siirry kohdekansioon
echo "Siirrytään kohdekansioon: $kohdekansio"
cd "$kohdekansio" || exit

# Tarkista, onko git-repositorio jo kloonattu
if [ -d ".git" ]; then
    # Jos klooni on jo olemassa, tee vain pull
    echo "Git-repositorio on jo kloonattu, suoritetaan pull."
    git pull
else
    # Muussa tapauksessa kloonaa git-repositorio
    echo "Kloonataan git-repositorio."
    git clone git@github.com:Shahtaa/kiertoajelu.git
fi



