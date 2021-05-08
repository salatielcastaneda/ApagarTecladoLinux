#!/bin/bash
Icon="/Documentos/Teclado/ApagarTecladoLinux/keyBoard-on.png"
Icoff="/Documentos/Teclado/ApagarTecladoLinux/keyBoard-off.png"
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
        notify-send -i $Icon "Enabling keyboard..." \ "ON - Keyboard connected !";
        echo "enable keyboard..."
        xinput reattach $id $master
        echo "enabled" > $fconfig
    elif [ $var = "enabled" ]; then
        notify-send -i $Icoff "Disabling Keyboard" \ "OFF - Keyboard disconnected";
        echo "disable keyboard"
        xinput float $id
        echo 'disabled' > $fconfig
fi
