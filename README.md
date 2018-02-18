# tempsensor
Lua support for 1-wire DS18B20 temperature sensor on Raspberry Pi.

This project provides provides two basic services:

* A Lua module for reading 1-wire temperature sensors under Linux.
* An application to allow a local SNMP agent to read the sensor data and place that data in the NET-SNMP extension table extTable.

## ds18B20.lua
This is the Lua module for accessing the sensors.



## tempSensor
This is an executable Lua programm for extending SNMP agents.

```usage: tempSensor OPTIONS
OPTIONS:
  -a           read all sensors
  -h           show this help
  -i index     read sensor by index
  -n name      read sensor by name
  -v           do not show units
  -l           list sensors by` id
```

## etc/snmpd.conf
Extract to showing how to extend NET-SNMP agent snmpd to use tempSensor as extension.

Call

```
snmpwalk -v 2c -c public HOSTNAME extTable
```
to receive the following output:

```
UCD-SNMP-MIB::extIndex.1 = INTEGER: 1
UCD-SNMP-MIB::extIndex.2 = INTEGER: 2
UCD-SNMP-MIB::extIndex.3 = INTEGER: 3
UCD-SNMP-MIB::extIndex.4 = INTEGER: 4
UCD-SNMP-MIB::extIndex.5 = INTEGER: 5
UCD-SNMP-MIB::extNames.1 = STRING: tempSensorList
UCD-SNMP-MIB::extNames.2 = STRING: tempSensor1
UCD-SNMP-MIB::extNames.3 = STRING: tempSensor2
UCD-SNMP-MIB::extNames.4 = STRING: tempSensor3
UCD-SNMP-MIB::extNames.5 = STRING: tempSensor4
UCD-SNMP-MIB::extCommand.1 = STRING: /usr/local/bin/tempSensor -l
UCD-SNMP-MIB::extCommand.2 = STRING: /usr/local/bin/tempSensor -i 1 -v
UCD-SNMP-MIB::extCommand.3 = STRING: /usr/local/bin/tempSensor -i 2 -v
UCD-SNMP-MIB::extCommand.4 = STRING: /usr/local/bin/tempSensor -i 3 -v
UCD-SNMP-MIB::extCommand.5 = STRING: /usr/local/bin/tempSensor -i 4 -v
UCD-SNMP-MIB::extResult.1 = INTEGER: 0
UCD-SNMP-MIB::extResult.2 = INTEGER: 0
UCD-SNMP-MIB::extResult.3 = INTEGER: 0
UCD-SNMP-MIB::extResult.4 = INTEGER: 0
UCD-SNMP-MIB::extResult.5 = INTEGER: 0
UCD-SNMP-MIB::extOutput.1 = STRING: 28-041750f0a4ff 28-04175034dcff 28-0417515bddff 28-041750b99bff
UCD-SNMP-MIB::extOutput.2 = STRING: 2.06
UCD-SNMP-MIB::extOutput.3 = STRING: 18.81
UCD-SNMP-MIB::extOutput.4 = STRING: 18.75
UCD-SNMP-MIB::extOutput.5 = STRING: 19.00
UCD-SNMP-MIB::extErrFix.1 = INTEGER: noError(0)
UCD-SNMP-MIB::extErrFix.2 = INTEGER: noError(0)
UCD-SNMP-MIB::extErrFix.3 = INTEGER: noError(0)
UCD-SNMP-MIB::extErrFix.4 = INTEGER: noError(0)
UCD-SNMP-MIB::extErrFix.5 = INTEGER: noError(0)
UCD-SNMP-MIB::extErrFixCmd.1 = STRING:
UCD-SNMP-MIB::extErrFixCmd.2 = STRING:
UCD-SNMP-MIB::extErrFixCmd.3 = STRING:
UCD-SNMP-MIB::extErrFixCmd.4 = STRING:
UCD-SNMP-MIB::extErrFixCmd.5 = STRING:
```
Look at extOutput.1 to extOutput.5 to see the list of sensors connected to the 1-wire line and the temperatures that each sensor delivers.