#!/usr/bin/perl

# ieServer.Net ��p DDNS IP �A�h���X�X�V�X�N���v�g - ddns-update.pl
# �쐬�ҁF�R�{���O@Agora Inc.�@�쐬��:2004/03/24
#
# ������蓖�ăO���[�o��IP�A�h���X���m�F���A�ω�������ΐVIP�A�h���X��
# DDNS�ɓo�^�B���R�}���h�����̊Ԋu�Ŏ��s���AIP�A�h���X�̕ω����Ď���
# �X�V��������B���p�ɂ� perl wget cron �����p�\�ł���K�v����B
#
# ����Ɋ��蓖�Ă�ꂽ IP�A�h���X �� http://ieserver.net/ipcheck.shtml
# �ւ̃A�N�Z�X�ɂ���Ċm�F�B
#
# cron �ɂē��R�}���h�𓙊Ԋu�Ŏ��s���A���IP���m�F�B�ω��������DDNS��
# IP�A�h���X��o�^�BDDNS�T�[�o�[�ւ̕��׌y���̓_������s�Ԋu��10���ȏ��
# ���邱�ƁB
# crontab�ݒ��(/usr/local/ddns/ddns.pl�ɃX�N���v�g��u��10���Ԋu�Ŏ��s)
# 5,15,25,35,45,55 * * * * /usr/local/ddns/ddns-update.pl

# �ȉ��Q�t�@�C���̔z�u�f�B���N�g���͍D�݂ɉ����ݒ�
# 1. �ݒ�IP�A�h���X���[�N�t�@�C��
$CURRENT_IP_FILE = "/home/kouzukekouryu/bin/log/current_ip";

#  2. �ݒ�󋵃��O�t�@�C��
$LOG_FILE        = "/home/kouzukekouryu/bin/log/ip_update.log";

# ���IP�m�F�y�[�WURL
$REMOTE_ADDR_CHK = "http://ieserver.net/ipcheck.shtml";
# DDNS�X�V�y�[�WURL
# wget��SSL�ڑ��\�Ńr���h���Ă���Ȃ�Ahttps:// �ł̐ڑ��𐄏�
$DDNS_UPDATE     = "https://ieserver.net/cgi-bin/dip.cgi";

# ieServer.Net�ɂĎ擾�����A�J�E���g�i�T�u�h���C���j�����L��
$ACCOUNT         = "kouzukek";     # �A�J�E���g(�T�u�h���C��)���ݒ�
$DOMAIN          = "dip.jp";     # �h���C�����ݒ�
$PASSWORD        = "shklshine";     # �p�X���[�h�ݒ�

if(!open(FILE,"$CURRENT_IP_FILE")) {
    $CURRENT_IP = '0.0.0.0';
    } else {
    $CURRENT_IP = <FILE>;
    close FILE;
}

$NEW_IP = '0.0.0.0';
$NEW_IP = `wget -q -O - $REMOTE_ADDR_CHK`;

if ($NEW_IP ne "0.0.0.0" and $CURRENT_IP ne $NEW_IP) {

    $STATUS = `wget -q -O - '$DDNS_UPDATE?username=$ACCOUNT&domain=$DOMAIN&password=$PASSWORD&updatehost=1'`;
    
    if ($STATUS =~ m/$NEW_IP/) {    
        open (FILE ,">$CURRENT_IP_FILE");
        print FILE $NEW_IP;
        close FILE;
        $TIME = localtime;
        open (FILE ,">>$LOG_FILE");
        print FILE "$TIME $ACCOUNT.$DOMAIN Updated $CURRENT_IP to $NEW_IP\n";
        close FILE;
    } else {
        $TIME = localtime;
        open (FILE ,">>$LOG_FILE");
        print FILE "$TIME $ACCOUNT.$DOMAIN Update aborted $CURRENT_IP to $NEW_IP\n";
        close FILE;
    }
}
exit;
