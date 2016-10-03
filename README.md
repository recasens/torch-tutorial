#Install torch
``` bash
git clone https://github.com/torch/distro.git ~/torch --recursive 
cd ~/torch; bash install-deps; 
./install.sh 
```



#Install ipython 
If needed:

``` bash
pip install ipython
```


#install packages
``` bash
luarocks install mnist
luarocks install image
```


#Install iTorch
``` bash
brew install zeromq
brew install openssl
luarocks install luacrypto OPENSSL_DIR=/usr/local/opt/openssl/


git clone https://github.com/facebook/iTorch.git
cd iTorch
luarocks make 
```

