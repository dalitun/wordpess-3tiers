# Wordpress 3 tiers

D'abord il faut créer une image wordpress préconfiguré et puis 
ajouter le script `mysql_conf.sh` dans le path `/home/cloud/mysql_conf.sh`


Editez le fichier vars.yml 

~~~
iam_url: https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3
username: 
password: 
domain: OCB********
tenant_name: eu-west-0
keypair_name: 
####vpc
vpc_url : https://vpc.eu-west-0.prod-cloud-ocb.orange-business.com/v1/df985c4254274a898212d008c05df799
vpc_url2: https://vpc.eu-west-0.prod-cloud-ocb.orange-business.com/v2.0
vpc_name: wordpress_vpc
vpc_net: 192.168.0.0/16
### SEC_GROUP
secgroup_name: wordpess_sec_group
###subnet
subnet_name: "wordpress-subnet"
subnet_net: 192.168.0.0/16
subnet_gateway: "192.168.0.1"
subnet_dhcp_enable: true
subnet_primary_dns: "8.8.8.8"
subnet_secondary_dns: "8.4.4.8"
availability_zone: "eu-west-0-a"
###RDS
rds_url: https://rds.eu-west-0.prod-cloud-ocb.orange-business.com/rds/v1/df985c4254274a898212d008c05df799
rds_name: wordpress
mysql_version: 5.6.35
flavor: 9900e9a1-dfc2-4418-b224-fea05d358ce3
region: eu-west-0
availability_zone: eu-west-0a
security_group_id: 71c89962-34a1-45e1-b985-c481a0dfa23e
root_password: Test@123
replication_mode: async
~~~


Pour Créer la stack wordpess 3 tiers: 

Cryptez les varibles vars.yml
```
ansible-vault encrypt vars.yml
```

```
ansible-playbook bootstrap.yml --ask-vault-pass -e @vars.yml
```
Pour supprimer la stack

```
ansible-playbook teardown.yml --ask-vault-pass -e @vars.yml -e @teardown-vars.yml

rm -rf teardown-vars.yml

```
