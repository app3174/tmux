#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

get_network_ip()
{
  case $(uname -s) in
    Linux)
      echo "$(ip route get 8.8.8.8 | awk '{print $7}')"
      ;;

  esac
}

main()
{
  network_ip_label=$(get_tmux_option "@dracula-network-ip-label" "IP")
  network_ip=$(get_network_ip)
  echo "$network_ip_label $network_ip"
}

#run main driver
main
