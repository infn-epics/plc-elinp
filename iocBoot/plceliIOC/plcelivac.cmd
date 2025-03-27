#!../../bin/linux-x86_64/plceli

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/plceli.dbd"
plceli_registerRecordDeviceDriver(pdbbase)


drvAsynIPPortConfigure("PLCELI_IP", "10.16.4.68:502", 0, 0, 0)
modbusInterposeConfig("PLCELI_IP",0,0,0)

drvModbusAsynConfigure("PLCELI_IO", "PLCELI_IP", 1,    3, 0, 5, 0, 1000, "PLCEL")

dbLoadRecords("$(TOP)/db/plcelivac.template","P=LEL,R=PLCMAG,PORT=PLCELI_IO")

iocInit()

