#  If 'make' isn't run from the root directory, we need to set these to
#  point to the upper level build directory.
ifeq "$(strip ${BUILD_DIR})" ""
  BUILD_DIR    := ../$(OSTYPE)-$(MACHINETYPE)/obj
endif
ifeq "$(strip ${TARGET_DIR})" ""
  TARGET_DIR   := ../$(OSTYPE)-$(MACHINETYPE)/bin
endif

TARGET   := overlapPair
SOURCES  := overlapPair.C \
            prefixEditDistance-allocateMoreSpace.C \
            prefixEditDistance-extend.C \
            prefixEditDistance-forward.C \
            prefixEditDistance-reverse.C

SRC_INCDIRS  := .. ../AS_UTL ../stores ../meryl/libleaff liboverlap

TGT_LDFLAGS := -L${TARGET_DIR}
TGT_LDLIBS  := -lleaff -lCA
TGT_PREREQS := libleaff.a libCA.a

SUBMAKEFILES :=