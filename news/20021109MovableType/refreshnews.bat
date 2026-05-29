
ECHO open home.wangjianshuo.com > c:\get.home.wangjianshuo.com
ECHO user YOUR_FTP_USERNAME >> c:\get.home.wangjianshuo.com
ECHO YOUR_FTP_PASSWORD >> c:\get.home.wangjianshuo.com
REM ECHO dir >> c:\get.home.wangjianshuo.com
ECHO cd store/tmpl >> c:\get.home.wangjianshuo.com
ECHO put D:\sha-jswang-01\My\Web\www.wangjianshuo.com\news\news.tmpl.htm >> c:\get.home.wangjianshuo.com

ECHO cd \archives  >> c:\get.home.wangjianshuo.com
ECHO Lcd D:\sha-jswang-01\My\Web\www.wangjianshuo.com\archives >> c:\get.home.wangjianshuo.com
ECHO Get index.htm  >> c:\get.home.wangjianshuo.com

ECHO close >> c:\get.home.wangjianshuo.com
ECHO quit >> c:\get.home.wangjianshuo.com


ftp -s:c:\get.home.wangjianshuo.com -i -n -d
Start http://"home.wangjianshuo.com/mt/mt.cgi?__mode=rebuild_confirm&blog_id=1"
Pause
ftp -s:c:\get.home.wangjianshuo.com -i -n -d

DEL c:\get.home.wangjianshuo.com
