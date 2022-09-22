*** Settings ***
Documentation        Arquivo de configuração dos resources

Library             factories/partner.py   # declarando o método do diretório como uma library

Resource            database.robot
Resource            services.robot