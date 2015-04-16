# 
# This file is part of the SIESTA package.
#
# Copyright (c) Fundacion General Universidad Autonoma de Madrid:
# E.Artacho, J.Gale, A.Garcia, J.Junquera, P.Ordejon, D.Sanchez-Portal
# and J.M.Soler, 1996- .
# 
# Use of this software constitutes agreement with the full conditions
# given in the SIESTA license, as signed by all legitimate users.
#
SIESTA_ARCH=magnus-xc40-intel-libsci-mpi
#
# For Cray XC40 at Pawsey with PrgEnv-intel
#
FC=ftn
FC_ASIS=$(FC)
LDFLAGS=-dynamic
#
FFLAGS=-O2 -fp-model precise
FFLAGS_DEBUG= -g -O0
RANLIB=echo
COMP_LIBS=
FPPFLAGS_COMP=
FPPFLAGS_SIESTA=-DGRID_DP -DPHI_GRID_SP
#
NETCDF_LIBS=
NETCDF_INTERFACE=
FPPFLAGS_CDF=-DCDF
#
MPI_LIBS=
MPI_INTERFACE=libmpi_f90.a
MPI_INCLUDE=.
FPPFLAGS_MPI=-DMPI
#
LIBS= 
SYS=nag
FPPFLAGS= ${FPPFLAGS_SIESTA} ${FPPFLAGS_COMP} $(FPPFLAGS_CDF) $(FPPFLAGS_MPI)
#
#
# Important 
# Compile atom.f and electrostatic.f without optimization.
# Make sure that the dependency is explicit, so that these
# lines work with VPATH
#
atom.o: atom.f
	$(FC) -c $(FFLAGS_DEBUG) $<
#
electrostatic.o: electrostatic.f
	$(FC) -c $(FFLAGS_DEBUG) $<
#
overfsm.o: overfsm.f
	$(FC) -c $(FFLAGS) -O1 $(INCFLAGS)   $<
#
.F.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS)  $(FPPFLAGS) $<
.f.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS)   $<
.F90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS)  $(FPPFLAGS) $<
.f90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS)   $<
#
