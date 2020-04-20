#!/bin/bash

login_url="http://localhost:8021/appUser/login"
av="apiVersion:0.4.0"
origin="Request-Origion:SwaggerBootstrapUi"
accept="accept:*/*"
content_type="Content-Type:application/json"

function login_token() {

}

curl -X POST "${login_url}" -H "${av}" -H "${origin}" -H "${accept}"  -H "${content_type}"  \
-d "{\"account\":\"\",\"channel\":\"\",\"ip\":\"\",\"openId\":\"\",\"password\":\"\",\"smCode\":\"\",\"tel\":\"\",\"type\":0}"
