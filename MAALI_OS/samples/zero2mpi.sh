# update fedora!!
sudo yum update
# install editors
sudo yum install nano
sudo yum install xemacs
sudo yum install xemacs-packages-base-el
sudo yum install xemacs-packages-extra-el
sudo yum install xorg-x11-xauth

# install software build tools
sudo yun install bc 
sudo yum install wget 
sudo yum install git
sudo yum install make

# install gnu compilers
sudo yum install gcc-gfortran 
sudo yum install gcc-c++

# install environment software
sudo yum install environment-modules

# install atlas math libs.
sudo yum install atlas 
sudo yum install atlas-devel
sudo yum install atlas-static
sudo yum install atlas-sse2-static   

# git the latest maali
git clone https://github.com/chrisbpawsey/maali.git

# create MAALI_ROOT directory 
sudo mkdir /nectar
sudo chown -R ec2-user:ec2-user /nectar

# edit maali.config file
MAALI_OS=fedora21
MAALI_SYSTEM=nectar
MAALI_ROOT="/$MAALI_SYSTEM/$MAALI_OS"
MAALI_BUILD_DIR="$MAALI_ROOT/build"
MAALI_MODULE_DIR="$MAALI_ROOT/modulefiles"
MAALI_SRC="$MAALI_ROOT/src"
#MAALI_SYSTEM_BUILD="YES"
#MAALI_DEFAULT_COMPILERS=""
#MAALI_DEFAULT_PYTHON=""
#MAALI_DEFAULT_MPI=""

# install maali
./maali -t maali -v 1.0b2 -c maali -d

# edit .maali/$MAALI_SYSTEM.config file.
# define MAALI_TOOL_COMPILERS variable
#        MAALI_DEFAULT_PYTHON
#        MAALI_DEFAULT_MPI

# edit the .modules paths to pick the maali created modulefiles
# NOTE do this as root.
cd /usr/share/Modules/init/
sudo vi .modulespath 
#add these paths to module 
/nectar/fedora21/modulefiles/tools
/nectar/fedora21/modulefiles/apps
/nectar/fedora21/modulefiles/devel
/nectar/fedora21/modulefiles/libs
/nectar/fedora21/modulefiles/python

# copy gnu/4.9.2 environment module to maali modulefiles 


module load maali
./add_builder ec2-user "Chris Bording" chris.bording@uwa.edu.au
export MAALI_BUILDER_UID=ec2-user
  
maali -t openmpi -v 1.7.5 -c nectar 
