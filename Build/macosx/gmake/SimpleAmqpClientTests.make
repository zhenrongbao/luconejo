# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_x32
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug_x32)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x32/Debug
  TARGET = $(TARGETDIR)/SimpleAmqpClientTests
  OBJDIR = ../../../obj/macosx/gmake/x32/Debug/SimpleAmqpClientTests
  DEFINES += -DBOOST_NO_VARIADIC_TEMPLATES -D_DEBUG
  INCLUDES += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include/lua5.1 -I/usr/local/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x32/Debug/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x32/Debug/libgtest.a -lrabbitmq -llua -lboost_system -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x32/Debug/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x32/Debug/libgtest.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -L/usr/local/lib -m32
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x64)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x64/Debug
  TARGET = $(TARGETDIR)/SimpleAmqpClientTests
  OBJDIR = ../../../obj/macosx/gmake/x64/Debug/SimpleAmqpClientTests
  DEFINES += -DBOOST_NO_VARIADIC_TEMPLATES -D_DEBUG
  INCLUDES += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include/lua5.1 -I/usr/local/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x64/Debug/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x64/Debug/libgtest.a -lrabbitmq -llua -lboost_system -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x64/Debug/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x64/Debug/libgtest.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L/usr/local/lib -m64
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x32)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x32/Release
  TARGET = $(TARGETDIR)/SimpleAmqpClientTests
  OBJDIR = ../../../obj/macosx/gmake/x32/Release/SimpleAmqpClientTests
  DEFINES += -DBOOST_NO_VARIADIC_TEMPLATES
  INCLUDES += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include/lua5.1 -I/usr/local/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O2
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x32/Release/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x32/Release/libgtest.a -lrabbitmq -llua -lboost_system -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x32/Release/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x32/Release/libgtest.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -L/usr/local/lib -m32 -Wl,-x
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x64)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x64/Release
  TARGET = $(TARGETDIR)/SimpleAmqpClientTests
  OBJDIR = ../../../obj/macosx/gmake/x64/Release/SimpleAmqpClientTests
  DEFINES += -DBOOST_NO_VARIADIC_TEMPLATES
  INCLUDES += -I../../../rabbitmq-c/librabbitmq -I../../../SimpleAmqpClient/src -I../../../LuaBridge-1.0.2 -I../../../SimpleAmqpClient/third-party/gtest-1.7.0 -I/usr/local/include/lua5.1 -I/usr/local/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x64/Release/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x64/Release/libgtest.a -lrabbitmq -llua -lboost_system -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x64/Release/libSimpleAmqpClient.a ../../../bin/macosx/gmake/x64/Release/libgtest.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L/usr/local/lib -m64 -Wl,-x
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/test_ack.o \
	$(OBJDIR)/test_channels.o \
	$(OBJDIR)/test_connect.o \
	$(OBJDIR)/test_consume.o \
	$(OBJDIR)/test_exchange.o \
	$(OBJDIR)/test_get.o \
	$(OBJDIR)/test_message.o \
	$(OBJDIR)/test_nack.o \
	$(OBJDIR)/test_publish.o \
	$(OBJDIR)/test_queue.o \
	$(OBJDIR)/test_table.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES) ${CUSTOMFILES}
	@echo Linking SimpleAmqpClientTests
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
	@echo Cleaning SimpleAmqpClientTests
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
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/test_ack.o: ../../../SimpleAmqpClient/testing/test_ack.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_channels.o: ../../../SimpleAmqpClient/testing/test_channels.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_connect.o: ../../../SimpleAmqpClient/testing/test_connect.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_consume.o: ../../../SimpleAmqpClient/testing/test_consume.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_exchange.o: ../../../SimpleAmqpClient/testing/test_exchange.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_get.o: ../../../SimpleAmqpClient/testing/test_get.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_message.o: ../../../SimpleAmqpClient/testing/test_message.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_nack.o: ../../../SimpleAmqpClient/testing/test_nack.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_publish.o: ../../../SimpleAmqpClient/testing/test_publish.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_queue.o: ../../../SimpleAmqpClient/testing/test_queue.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test_table.o: ../../../SimpleAmqpClient/testing/test_table.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
