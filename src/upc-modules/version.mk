NAME        = upc-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/compilers/upc

VERSION_SRC = $(REDHAT.ROOT)/src/upc/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
