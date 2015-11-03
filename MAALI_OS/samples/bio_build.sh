# update ubuntu!!
sudo apt-get update
# install editors - note nano is already installed
sudo apt-get install xemacs21
sudo apt-get install xemacs21-basesupport-el
sudo apt-get install x11-apps
sudo apt-get install xauth

# install software build tools
sudo apt-get install bc wget git make unzip 

# install gnu compilers
sudo apt-get install gfortran 
sudo apt-get install g++
sudo apt-get install gcc

# install environment software
sudo apt-get install environment-modules

# git the latest maali
git clone https://github.com/chrisbpawsey/maali.git

# create MAALI_ROOT directory 
sudo mkdir /nectar
sudo chown -R ubuntu:ubuntu /nectar

cd maali
# you should find a file called maali.config
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
# use sudo xemacs .modulespath
# use sudo nano .modulespath
# use sudo vi .modulespath

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
maali -t samtools -v 1.2 -c nectar

maali -t openmpi -v 1.7.5 -c nectar 
maali -t picard-tools -v 1.123 -c nectar

maali -t mothur -v 1.37.0 -c nectar
maali -t mrbayes -v 3.2.2 -c nectar
maali -t geneid -v 1.4.4 -c nectar
maali -t fastqc -v 0.11.2 -c nectar
maali -t exabayes -v 1.4.1 -c nectar
maali -t bwa -v 0.7.5a -c nectar
maali -t bwa -v 0.7.9a -c nectar
maali -t beagle-lib -v 2.1.2 -c nectar
maali -t beast -v 2.1.3 -c nectar
maali -t mummer -v 3.23 -c nectar 

maali -t genomeanalysistk -v 3.4.46 -c nectar

maali -t python -v 2.6.9 -c nectar
maali -t python-boost -v 1.55.0 -c nectar

maali -t tophat -v 2.0.12 -c nectar

#maali -t trimmomatic -v 0.32 -c nectar
#maali -t trinityrnseq -v 20140717 -c nectar
#maali -t tassel -v 3.0 -c nectar
maali -t ncbi-blast -v 2.2.29 -c nectar

maali -t structure -v 2.3.4 -c nectar
maali -t bioperl -v 1.6.924 -c nectar
maali -t velvet -v 1.2.10 -c nectar
#maali -t oases -v 0.2.08 -c nectar

maali -t autodock -v 4.2.3 -c nectar