mkdir -p /tmp/deepin-wine
cd /tmp/deepin-wine
echo '下载deepin-wine安装包'
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine_2.18-22~rc0_all.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32_2.18-22~rc0_i386.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32-preloader_2.18-22~rc0_i386.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-helper/deepin-wine-helper_1.2deepin8_i386.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-plugin/deepin-wine-plugin_1.0deepin2_amd64.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-plugin-virtual/deepin-wine-plugin-virtual_1.0deepin3_all.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-uninstaller/deepin-wine-uninstaller_0.1deepin2_i386.deb
wget https://packages.deepin.com/deepin/pool/non-free/u/udis86/udis86_1.72-2_i386.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-fonts-wine_2.18-22~rc0_all.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-libwine_2.18-22~rc0_i386.deb
wget https://packages.deepin.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_amd64.deb
wget https://packages.deepin.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_i386.deb

#echo '添加32位支持'
sudo dpkg --add-architecture i386

echo '刷新apt缓存信息'
sudo apt-get update

echo '开始安装'
sudo dpkg -i *.deb

echo '安装依赖'
sudo apt install -fy
echo '下载微信安装包'
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.8.65deepin0_i386.deb
wget https://packages.deepin.com/deepin/pool/non-free/d/deepin.com.weixin.work/deepin.com.weixin.work_2.8.10.2010deepin0_i386.deb
echo '安装'
sudo dpkg -i deepin.com.wechat_2.6.8.65deepin0_i386.deb
sudo dpkg -i deepin.com.weixin.work_2.8.10.2010deepin0_i386.deb
echo '安装完成'
