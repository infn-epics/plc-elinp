TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET


# Build the IOC application
PROD_IOC = plceli

# plceli.dbd will be created and installed
DBD += plceli.dbd

# plceli.dbd will include these files:
plceli_DBD += base.dbd
plceli_DBD += modbusSupport.dbd
plceli_DBD += asyn.dbd
plceli_DBD += drvAsynIPPort.dbd

# plceli_registerRecordDeviceDriver.cpp derives from plceli.dbd
plceli_SRCS += plceli_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
plceli_SRCS_DEFAULT += plceliMain.cpp
plceli_SRCS_vxWorks += -nil-

# Link in the code from our support library
#plceli_LIBS += plceliSupport


# # Link QSRV (pvAccess Server) if available
# ifdef EPICS_QSRV_MAJOR_VERSION
#     plceli_LIBS += qsrv
#     plceli_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
#     plceli_DBD += PVAServerRegister.dbd
#     plceli_DBD += qsrv.dbd
# endif

# Finally link IOC to the EPICS Base libraries
plceli_LIBS += asyn modbus $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devplceliVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
