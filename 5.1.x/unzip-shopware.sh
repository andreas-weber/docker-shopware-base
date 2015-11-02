#!/bin/bash

cd /shopware

if [ -f ./shop.zip ]; then

    unzip -n -q shop.zip
    rm shop.zip

    if [ -d ./recovery ]; then
        mv ./recovery /swrecovery
    fi

    if [ -d ./install ]; then
        mv ./install /swinstall
    fi

    if [ -f ./demo.zip ]; then
        unzip ./demo.zip
        rm ./demo.zip
    fi

    mkdir -p /shopware/var
    mkdir -p /shopware/var/logs

    chown -R www-data:www-data /shopware/

    chmod 775 -R var/cache var/logs files media engine/Shopware/Plugins/Community

    mv var/log /swvolumes/log
    mv files /swvolumes/files
    mv media /swvolumes/media

fi