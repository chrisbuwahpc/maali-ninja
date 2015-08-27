# update ubuntu!!
sudo apt-get update
# install editors - note nano is already installed
sudo apt-get install xemacs21
sudo apt-get install xemacs-packages-base-el
sudo apt-get install xemacs-packages-extra-el
sudo apt-get install x11-apps
sudo apt-get install xauth

# install software build tools
sudo apt-get install bc 
sudo apt-get install wget 
sudo apt-get install git
sudo apt-get install make

# install gnu compilers
sudo apt-get install gcc-gfortran 
sudo apt-get install gcc-c++

# install environment software
sudo apt-get install environment-modules

# install atlas math libs.
sudo apt-get install atlas 
sudo apt-get install atlas-devel
sudo apt-get install atlas-static
sudo apt-get install atlas-sse2-static   

# git the latest maali
git clone https://github.com/chrisbpawsey/maali.git

# create MAALI_ROOT directory 
sudo mkdir /nectar
sudo chown -R ubuntu:ubuntu /nectar

# edit maali.config file in the maali directory
# so that it looks like this!
MAALI_OS=ubuntu14
MAALI_SYSTEM=nectar
MAALI_ROOT="/$MAALI_SYSTEM/$MAALI_OS"
MAALI_BUILD_DIR="$MAALI_ROOT/build"
MAALI_MODULE_DIR="$MAALI_ROOT/modulefiles"
MAALI_SRC="$MAALI_ROOT/src"
#MAALI_SYSTEM_BUILD="YES"
#MAALI_DEFAULT_COMPILERS=""
#MAALI_DEFAULT_GCC_COMPILERS=""
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

cd /usr/share/modules/init/



# next step format modulepath file
# use sudo xemacs .modulepath

#add these paths to module 
/nectar/ubuntu14/modulefiles/tools
/nectar/ubuntu14/modulefiles/apps
/nectar/ubuntu14/modulefiles/devel
/nectar/ubuntu14/modulefiles/libs
/nectar/ubuntu14/modulefiles/python
/nectar/ubuntu14/modulefiles/bio-apps

# copy gnu/4.9.2 environment module to maali modulefiles 
mkdir -p /nectar/ubuntu14/modulefiles/devel/gnu
cp ~/maali/MAALI_OS/samples/gnu-4.8.3 /nectar/ubunt14/modulefiles/devel/gnu/4.9.1
cd /nectar/ubuntu14/modulefiles/devel/gnu

xemacs 4.9.1  or  nano 4.9.1

change 4.8.3 to 4.9.1  # note this is for ubuntu14  different linux versions
                       # maybe using a different version of gcc
                       # use gcc -v to check your version

ubuntu@perkins:~$ module avail

----------------------------- /usr/share/modules/versions ----------------
3.2.10

---------------------------- /usr/share/modules/modulefiles --------------
dot         module-git  module-info modules     null        use.own

-------------------------- /nectar/ubuntu14/modulefiles/tools ------------
maali/1.0b2(default)

-------------------------- /nectar/ubuntu14/modulefiles/devel ------------
gnu/4.9.1

module load maali


# setup builder id
cd ~/maali 

./add_builder ubuntu "Chris Bording" chris.bording@uwa.edu.au
export MAALI_BUILDER_UID=ubuntu
  
maali -t bowtie2 -v 2.2.6 -c nectar

maali -t openmpi -v 1.7.5 -c nectar 
