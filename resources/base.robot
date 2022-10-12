*** Settings ***
Documentation        Arquivo de configuração dos resources

# Libraries
Library             factories/partner.py   # declarando o método do diretório como uma library

# Path resources files
Resource            database.robot
Resource            services.robot
Resource            helpers.robot