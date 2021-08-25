 # my_dot_file
 ### 使用方法
 1. 先删除或者备份home路径下的.vim文件夹及.vimrc文件
 ```
 rm -rf ~/.vim ~/.vimrc
 ```
 or
 ```
 mv ~/.vim ~/.vim.orig; mv ~/.vimrc ~/.vimrc.orig
 ```
 2. 再克隆
  ```
 git clone https://github.com/zhengduoru/my_dot_file.git ~/.vimtemp ; mv ~/.vimtemp/.tmux/ ~ ; mv ~/.vimtemp/.vim* ~ ; mv ~/.vimtemp/.tmux.conf ~; cat ~/.vimtemp/.bashrc.part >> ~/.bashrc; unzip -q ~/.vimtemp/YouCompleteMe.zip && mv YouCompleteMe ~/.vim/bundle;  rm -rf ~/.vimtemp; 
  ```
 
 3. 加上sqlformat依赖
 ```
 pip install --upgrade sqlparse
 pip install sqlformat
 ```
