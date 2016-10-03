To be ready for the tutorial, you would need to install some libraries. Here some installing instructions. 

#Install torch
``` bash
git clone https://github.com/torch/distro.git ~/torch --recursive 
cd ~/torch; bash install-deps; 
./install.sh 

# On Linux with bash
source ~/.bashrc
# On Linux with zsh
source ~/.zshrc
# On OSX or in Linux with none of the above.
source ~/.profile
```



#Install ipython and Jupyter
If needed:

``` bash
pip install ipython==4
pip install jupyter
```


#Install packages
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

