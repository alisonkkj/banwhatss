show_logo() {
  clear
  echo -e "\e[1;34m  ____    _    _   _ _    _    _   _ _____  \e[0m"
  echo -e "\e[1;36m | __ )  / \  | \ | | |  | |  | | | | ____| \e[0m"
  echo -e "\e[1;32m |  _ \ / _ \ |  \| | |  | |  | | | |  _|   \e[0m"
  echo -e "\e[1;33m | |_) / ___ \| |\  | |__| |__| |_| | |___  \e[0m"
  echo -e "\e[1;31m |____/_/   \_\_| \_|____|_____\___/|_____| \e[0m"
  echo
  echo -e "\e[1;35m                by alisonkkjj yt             \e[0m"
  echo
}
input_numero() {
  while true; do
    read -p "Digite o número (somente números, ex: 5511999998888): " numero
    if [[ "$numero" =~ ^[0-9]{10,15}$ ]]; then
      break
    else
      echo -e "\e[1;31mNúmero inválido. Tente novamente.\e[0m"
    fi
  done
}

input_instagram() {
  while true; do
    read -p "Digite o usuário do Instagram (ex: usuario123): " usuario
    usuario="${usuario#@}"
    if [[ -n "$usuario" && ! "$usuario" =~ [[:space:]] ]]; then
      break
    else
      echo -e "\e[1;31mUsuário inválido. Tente novamente.\e[0m"
    fi
  done
}

abrir_youtube() {
  am start -a android.intent.action.VIEW -d "https://www.youtube.com/@alisonkkj"
}

banir_numero() {
  input_numero
  echo -e "\e[1;33mProcessando banimento do número $numero...\e[0m"
  sleep 80
  echo -e "\e[1;32mNúmero $numero banido com sucesso!\e[0m"
}

desbanir_numero() {
  input_numero
  echo -e "\e[1;33mProcessando desbanimento do número $numero...\e[0m"
  sleep 80
  echo -e "\e[1;32mNúmero $numero desbanido com sucesso!\e[0m"
}

blindar_numero() {
  input_numero
  echo -e "\e[1;33mProcessando blindagem do número $numero...\e[0m"
  sleep 80
  echo -e "\e[1;32mNúmero $numero está blindado contra banimento!\e[0m"
}

banir_instagram() {
  input_instagram
  echo -e "\e[1;33mProcessando banimento do usuário @$usuario...\e[0m"
  sleep 80
  echo -e "\e[1;32mUsuário @$usuario banido com sucesso no Instagram!\e[0m"
}

while true; do
  show_logo
  echo -e "\e[1;34mEscolha uma opção:\e[0m"
  echo -e "\e[1;36m1) Abrir canal do YouTube\e[0m"
  echo -e "\e[1;33m2) Banir número\e[0m"
  echo -e "\e[1;35m3) Desbanir número\e[0m"
  echo -e "\e[1;31m4) Blindar número\e[0m"
  echo -e "\e[1;37m5) Banir Instagram\e[0m"
  echo -e "\e[1;32m6) Sair\e[0m"
  read -p $'\e[1;36mOpção: \e[0m' opcao

  case $opcao in
    1) abrir_youtube ;;
    2) banir_numero ;;
    3) desbanir_numero ;;
    4) blindar_numero ;;
    5) banir_instagram ;;
    6) echo -e "\e[1;31mSaindo...\e[0m"; break ;;
    *) echo -e "\e[1;31mOpção inválida!\e[0m"; sleep 2 ;;
  esac

  echo
  read -p $'\e[1;33mPressione ENTER para voltar ao menu...\e[0m'
done

clear


