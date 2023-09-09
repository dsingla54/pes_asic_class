sudo apt-get install vim -y 
sudo apt-get install autoconf -y 
sudo apt-get install automake -y
sudo apt-get install autotools-dev -y 
sudo apt-get install curl -y
sudo apt-get install libmpc-dev libmpfr-dev libgmp-dev -y 
sudo apt-get install gawk -y 
sudo apt-get install build-essential -y 
sudo apt-get install bison flex -y 
sudo apt-get install texinfo gperf -y 
sudo apt-get install -y 
sudo apt-get install patchutils bc -y 
sudo apt-get install zlib1g-dev libexpat1-dev -y 
sudo apt-get install git -y
sudo apt-get install gtkwave -y
cd
pwd=$PWD
mkdir riscv_toolchain
cd riscv_toolchain
wget "https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz"
tar -xvzf riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz 
export PATH=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/bin:$PATH
sudo apt-get install device-tree-compiler -y
git clone https://github.com/riscv/riscv-isa-sim.git
cd riscv-isa-sim/
mkdir build
cd build
../configure --prefix=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14
make
sudo make install
cd $pwd/riscv_toolchain
git clone https://github.com/riscv/riscv-pk.git
cd riscv-pk/
mkdir build
cd build/
../configure --prefix=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14 --host=riscv64-unknown-elf
make
sudo make install
export PATH=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/bin:$PATH
cd $pwd/riscv_toolchain
git clone https://github.com/steveicarus/iverilog.git
cd iverilog/
git checkout --track -b v10-branch origin/v10-branch
git pull 
chmod 777 autoconf.sh 
./autoconf.sh 
./configure 
make
sudo make install 
