#!/bin/bash

# start.shで、UI_LOGOが、Contosoに書き換わってしまうので、./static/assets/index*.js のUI_LOGOを、所望のロゴに、書き換える。
sed -i 's/Contoso-ff70ad88.svg/https:\/\/static.wixstatic.com\/media\/ea4352_bfec257a42b94aa596ecefb787951797~mv2.jpg\/v1\/fill\/w_146,h_50,al_c,q_80,usm_0.66_1.00_0.01,enc_auto\/DX-LOGO_edited.jpg/g' ./static/assets/index*.js

az webapp config appsettings set -g open-ai -n smacomdoc --settings WEBSITE_WEBDEPLOY_USE_SCM=false
az webapp up --runtime PYTHON:3.11 --sku F1 --name smacomdoc --resource-group open-ai
az webapp config set --startup-file "python3 -m gunicorn app:app" --name smacomdoc