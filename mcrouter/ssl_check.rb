#!/usr/bin/env ruby
# How to:
# =======
# Use Ruby's net/https library, to verify a SSL certificate.
# ==========================================================
# - Without verification the following code will lead to:
# warning: peer certificate won't be verified in this SSL session
#
# #------------------begin example-----------------------------
# require 'net/http'
# require 'net/https'
# require 'uri'
# 
# url = URI.parse 'https://myname:mypass@mail.google.com/'
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = (url.scheme == 'https')
# request = Net::HTTP::Get.new(url.path)
# request.basic_auth url.user, url.password
# response = http.request(request)
# #-------------------end example------------------------------
# 
#  To verify the ssl cert cosider adapting the following.
# Status: Untested
# =======
#
# References:
# ===========
# [1] http://mimori.org/%7Eh/tdiary/20080301.html#p03
# [2] http://redcorundum.blogspot.com/2008/03/ssl-certificates-and-nethttps.html
#
require 'net/http'
require 'net/https'
require 'uri'

RootCA = '/etc/ssl/certs/*.pem'

url = URI.parse 'https://aff.valuecommerce.ne.jp/'
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = (url.scheme == 'https')
if (File.directory?(RootCA) && http.use_ssl?)
  http.ca_path = RootCA
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  http.verify_depth = 5
else
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
end
request = Net::HTTP::Get.new(url.path)
request.basic_auth url.user, url.password
response = http.request(request)
