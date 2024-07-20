#!/bin/bash

# Título do Script
TITLE="Manjaro MGR 1.0 Escrito por mistRaven"

# Função para exibir a mensagem de boas-vindas
display_welcome_message() {
    dialog --msgbox "Olá e bem-vindo ao Gerenciador Pacman & Yay!" 10 50
}

# Função para exibir o menu
display_menu() {
    dialog --title "$TITLE" \
           --backtitle "Menu rav3n 1.0" \
           --menu "Escolha uma opção" 20 60 6 \
           1 "Atualizar o sistema" \
           2 "Instalar pacote" \
           3 "Remover pacote" \
           4 "Atualizar yay" \
           5 "Sair" 2> /tmp/option.txt
}

# Função para atualizar o sistema
update_system() {
    dialog --msgbox "Atualizando o sistema..." 6 30
    sudo pacman -Syu
    dialog --msgbox "Atualização concluída." 6 30
}

# Função para instalar um pacote
install_package() {
    PACKAGE=$(dialog --inputbox "Digite o nome do pacote para instalar:" 8 40 2> /tmp/package.txt)
    if [ -n "$PACKAGE" ]; then
        dialog --msgbox "Instalando $PACKAGE..." 6 30
        sudo pacman -S "$PACKAGE"
        dialog --msgbox "$PACKAGE instalado." 6 30
    fi
}

# Função para remover um pacote
remove_package() {
    PACKAGE=$(dialog --inputbox "Digite o nome do pacote para remover:" 8 40 2> /tmp/package.txt)
    if [ -n "$PACKAGE" ]; then
        dialog --msgbox "Removendo $PACKAGE..." 6 30
        sudo pacman -R "$PACKAGE"
        dialog --msgbox "$PACKAGE removido." 6 30
    fi
}

# Função para atualizar o yay
update_yay() {
    dialog --msgbox "Atualizando o yay..." 6 30
    yay -Syu
    dialog --msgbox "Atualização do yay concluída." 6 30
}

# Exibir mensagem de boas-vindas
display_welcome_message

# Loop do menu
while true; do
    display_menu
    OPTION=$(< /tmp/option.txt)
    case $OPTION in
        1) update_system ;;
        2) install_package ;;
        3) remove_package ;;
        4) update_yay ;;
        5) 
            dialog --msgbox "Saindo..." 6 30
            dialog --msgbox "Em memória do meu filho Alucard e do meu mentor Mithrandir" 10 50
            break
            ;;
    esac
done

# Assinatura
echo "BY NECROMANCERS-CODE"
