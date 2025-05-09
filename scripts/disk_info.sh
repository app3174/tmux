#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

get_disk_info()
{
  case $(uname -s) in
    Linux)
      echo "$(df -h / | tail -1 | awk '{print $3 " (" $5 ")"}')"
      ;;

  esac
}

main()
{
  disk_label=$(get_tmux_option "@dracula-disk-usage-label" "DISK")
  disk_ratio=$(get_disk_info)
  echo "$disk_label $disk_ratio"
}

#run main driver
main
