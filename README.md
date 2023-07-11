# Utility_script
__实用脚本程序__，适用的环境是Centos7和Mysql5.7<br>
### 01-files.sh<br>
>统计指定系统目录下的文件数。使用方法如下:<br>
sh 01-files.sh /etc<br>

### 02-rename.sh<br>
>指定路径和新命名的后缀，批量重命名文件。使用方法如下:<br>
sh 02-rename.sh /mnt txt<br>

### 03-backup.sh<br>
>备份文件，如需指定目录和文件路径，输入即可。否则会以默认文件路径备份，可结合计划任务调度使用。使用方法如下:<br>
sh 03-backup.sh<br>

### 04-monitoring.sh<br>
>日志文件邮件报警，如需指定收件人邮箱和日志文件，输入即可。否则会以默认邮箱和日志文件进行监控，可结合后台运行使用。使用方法如下:<br>
sh 04-monitoring.sh<br>



