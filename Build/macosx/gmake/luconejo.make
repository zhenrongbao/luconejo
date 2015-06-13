# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug32
endif

ifndef verbose
  SILENT = @
endif

CC = gcc
CXX = g++
AR = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/Debug/luconejo/x32
  TARGETDIR  = ../../..
  TARGET     = $(TARGETDIR)/luconejo.so
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DDEBUG -D_DEBUG
  INCLUDES  += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m32 -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L. -L../../../bin/macosx/gmake/x32/Debug -dynamiclib -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Debug/libSimpleAmqpClient.a
  LIBS      += $(LDDEPS) -lrabbitmq -llua -lboost_system -lboost_chrono
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/Release/luconejo/x32
  TARGETDIR  = ../../..
  TARGET     = $(TARGETDIR)/luconejo.so
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DRELEASE
  INCLUDES  += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m32 -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L. -L../../../bin/macosx/gmake/x32/Release -Wl,-x -dynamiclib -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Release/libSimpleAmqpClient.a
  LIBS      += $(LDDEPS) -lrabbitmq -llua -lboost_system -lboost_chrono
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Debug/luconejo/x64
  TARGETDIR  = ../../..
  TARGET     = $(TARGETDIR)/luconejo.so
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DDEBUG -D_DEBUG
  INCLUDES  += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m64 -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L. -L../../../bin/macosx/gmake/x64/Debug -dynamiclib -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Debug/libSimpleAmqpClient.a
  LIBS      += $(LDDEPS) -lrabbitmq -llua -lboost_system -lboost_chrono
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Release/luconejo/x64
  TARGETDIR  = ../../..
  TARGET     = $(TARGETDIR)/luconejo.so
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DRELEASE
  INCLUDES  += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m64 -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L. -L../../../bin/macosx/gmake/x64/Release -Wl,-x -dynamiclib -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Release/libSimpleAmqpClient.a
  LIBS      += $(LDDEPS) -lrabbitmq -llua -lboost_system -lboost_chrono
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/luconejo.o \
	$(OBJDIR)/luconejo_lib.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking luconejo
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning luconejo
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
.NOTPARALLEL: $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -MMD -MP $(DEFINES) $(INCLUDES) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/luconejo.o: ../../../src/luconejo.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/luconejo_lib.o: ../../../src/luconejo_lib.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
