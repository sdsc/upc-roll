NAME               = upc_$(ROLLCOMPILER)_$(ROLLMPI)_$(ROLLNETWORK)
VERSION            = 2.16.0
RELEASE            = 0
PKGROOT            = /opt/upc
RPM.EXTRAS         = AutoReq:No

SRC_SUBDIR         = upc

SOURCE_NAME        = upc
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

UPC_TRANS_NAME     = upc_translator
UPC_TRANS_PKG      = $(UPC_TRANS_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
UPC_TRANS_DIR      = $(UPC_TRANS_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG) $(UPC_TRANS_PKG)

