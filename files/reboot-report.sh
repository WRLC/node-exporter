#!/bin/bash
if [ -f /var/run/reboot-required ]; then
  echo 'reboot_required 1' > /var/prometheus/text_collector/reboot_required.prom
else
  echo 'reboot_required 0' > /var/prometheus/text_collector/reboot_required.prom
fi
