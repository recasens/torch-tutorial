#Install torch
``` bash
git clone https://github.com/torch/distro.git ~/torch --recursive \n
cd ~/torch; bash install-deps; \n
./install.sh \n
```



#Install ipython 

--pip install ipython

#install packages
luarocks install mnist
luarocks install image


#Install iTorch
brew install zeromq
brew install openssl
luarocks install luacrypto OPENSSL_DIR=/usr/local/opt/openssl/


git clone https://github.com/facebook/iTorch.git
cd iTorch
luarocks make 
