#! /bin/bash

#####
#
# A Script to install HPE repos and public keys
#
# Written by Joel E White
#
#####

# VAR
Dist="stretch"
Project_Ver="current"

# PRE
apt-get install -y -q curl

echo 'Adding Public Keys for Debian'
curl http://downloads.linux.hpe.com/SDR/hpPublicKey1024.pub | apt-key add -
curl http://downloads.linux.hpe.com/SDR/hpPublicKey2048.pub | apt-key add -
curl http://downloads.linux.hpe.com/SDR/hpPublicKey2048_key1.pub | apt-key add -
curl http://downloads.linux.hpe.com/SDR/hpePublicKey2048_key1.pub | apt-key add -

touch /etc/apt/sources.list.d/hpe_mgmt.list
echo '# HPE Management Component Pack' >> /etc/apt/sources.list.d/hpe_mgmt.list
echo "deb http://downloads.linux.hpe.com/SDR/repo/mcp ${Dist}/${Project_Ver} non-free" >> /etc/apt/sources.list.d/hpe_mgmt.list


# MAIN
apt-get update


# Packages available -- List taken from https://downloads.linux.hpe.com/SDR/project/mcp/
# hp-health	HPE System Health Application and Command line Utilities (Gen9 and earlier)
# hponcfg	HPE RILOE II/iLO online configuration utility
# hp-ams	HPE Agentless Management Service (Gen9 and earlier)
# hp-snmp-agents	Insight Management SNMP Agents for HPE ProLiant Systems (Gen9 and earlier)
# hpsmh	HPE System Management Homepage (Gen9 and earlier)
# hp-smh-templates	HPE System Management Homepage Templates (Gen9 and earlier)
# ssacli	HPE Command Line Smart Storage Administration Utility
# ssaducli	HPE Command Line Smart Storage Administration Diagnostics
# ssa	HPE Array Smart Storage Administration Service
