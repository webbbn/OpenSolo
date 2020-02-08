# To cross compile:
#
# Set up as usual for bitbake:
# $ . setup-environment build
#
# In the build directory:
# $ bitbake meta-ide-support
# $ . tmp/environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi
#
# Now a make in this directory should work.

VPATH = ../../ini ../../ini/cpp

INCS = -I../../ini -I../../ini/cpp -I$(OECORE_TARGET_SYSROOT)/usr/include/libnl3

CFLAGS += -Wall $(INCS)
CXXFLAGS += -Wall $(INCS) $(PKGCONFIG)

LIBS = -lv4l2

SRCS_CPP = v4l2_to_udp.cc

OBJS = $(SRCS_CPP:.cpp=.o) $(SRCS_C:.c=.o)

MAIN = v4l2_to_udp

all: $(MAIN)

$(MAIN): $(OBJS)
	  $(LINK.cpp) -o $(MAIN) $(OBJS) $(LIBS)

clean:
	  $(RM) *.o *~ $(MAIN) *Test

BASE := ../../..

fmt:
	@python $(BASE)/tools/build/clang-format-run.py --apply

fmt-diff:
	@python $(BASE)/tools/build/clang-format-run.py

.PHONY: all clean fmt fmt-diff
