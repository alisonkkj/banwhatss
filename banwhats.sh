#!/bin/bash

show_logo() {
  clear
  cat << "EOF"
 ____    _    _   _ _    _    _   _ _____ 
| __ )  / \  | \ | | |  | |  | | | | ____|
|  _ \ / _ \ |  \| | |  | |  | | | |  _|  
| |_) / ___ \| |\  | |__| |__| |_| | |___ 
|____/_/   \_\_| \_|____|_____\___/|_____|

                by alisonkkjj yt
EOF
  echo
}

input_numero() {
  while true; do
    numero=$(dialog --stdout --inputbox "Digite o número (somente números, ex: 5511999998888):" 8 50)
    if [[ "$numero" =~ ^[0-9]{10,15}$ ]]; then
      break
    else
      dialog --msgbox "Número inválido. Tente novamente." 6 40
    fi
  done
}

barra_progresso() {
  {
    for ((i=0; i<=100; i+=2)); do
      echo $i
      sleep 0.3  # ajuste o tempo aqui para durar o quanto quiser
    done
  } | dialog --gauge "Processando..." 10 60 0
}

abrir_youtube() {
  # No Termux Android, usa o comando am para abrir link no navegador
  am start -a android.intent.action.VIEW -d "https://www.youtube.com/@alisonkkj"
}

banir_numero() {
  input_numero
  barra_progresso
  dialog --msgbox "Número $numero banido com sucesso!" 6 50
}

desbanir_numero() {
  input_numero
  barra_progresso
  dialog --msgbox "Número $numero desbanido com sucesso!" 6 50
}

blindar_numero() {
  input_numero
  barra_progresso
  dialog --msgbox "Número $numero está blindado contra banimento!" 6 50
}

while true; do
  show_logo
  opcao=$(dialog --stdout --menu "Painel BanWhats - Escolha uma opção:" 20 60 7 \
    1 "Abrir canal do YouTube" \
    2 "Banir número" \
    3 "Desbanir número" \
    4 "Blindar número" \
    5 "Sair")

  case $opcao in
    1) abrir_youtube ;;
    2) banir_numero ;;
    3) desbanir_numero ;;
    4) blindar_numero ;;
    5) clear; exit 0 ;;
    *) dialog --msgbox "Opção inválida!" 5 30 ;;
  esac
done
