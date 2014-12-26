ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

ifndef ROLLMPI
  ROLLMPI = rocks-openmpi
endif
MPINAME := $(firstword $(subst /, ,$(ROLLMPI)))

NAME              = sdsc-upc
VERSION           = 2.20.0
RELEASE           = 0
PKGROOT           = /opt/upc

SRC_SUBDIR        = upc

SOURCE_NAME       = berkeley_upc
SOURCE_SUFFIX     = tar.gz
SOURCE_VERSION    = $(VERSION)
SOURCE_PKG        = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR        = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

UPC_TRANS_NAME    = berkeley_upc_translator
UPC_TRANS_SUFFIX  = tar.gz
UPC_TRANS_VERSION = $(VERSION)
UPC_TRANS_PKG     = $(UPC_TRANS_NAME)-$(UPC_TRANS_VERSION).$(UPC_TRANS_SUFFIX)
UPC_TRANS_DIR     = $(UPC_TRANS_PKG:%.$(UPC_TRANS_SUFFIX)=%)

TAR_GZ_PKGS       = $(SOURCE_PKG) $(UPC_TRANS_PKG)

RPM.EXTRAS        = AutoReq:No
