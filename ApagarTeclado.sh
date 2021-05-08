#!/bin/bash
Icon="/home/sala/Documentos/Teclado/ApagarTecladoLinux/keyBoard-on.png"
Icoff="/home/sala/Documentos/Teclado/ApagarTecladoLinux/keyBoard-off.png"
fconfig=".keyboard" 
id=7
master=3

if [ ! -f $fconfig ];
    then
        echo "Creating config file"
        echo "enabled" > $fconfig
        var="enabled"
    else
        read -r var< $fconfig
        echo "keyboard is : $var"
fi

if [ $var = "disabled" ];
    then
        notify-send -i $Icon "Habilitando Teclado..." \ "ON - Teclado Conectado!";
        echo "enable keyboard..."
        xinput reattach $id $master
        echo "enabled" > $fconfig
    elif [ $var = "enabled" ]; then
        notify-send -i $Icoff "Deshabilitando Teclado.." \ "OFF - Teclado Desconectado";
        echo "disable keyboard"
        xinput float $id
        echo 'disabled' > $fconfig
fi
