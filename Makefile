LUAV=5.2
INSTALL_BIN=/usr/local/bin
INSTALL_LUA=/usr/local/share/lua/$(LUAV)
LUAMODULE=ds18b20.lua
SNMPEXTENDER=tempSensor

install:
	cp $(SNMPEXTENDER) $(INSTALL_BIN)
	cp $(LUAMODULE) $(INSTALL_LUA)	

uninstall:
	rm -rf $(INSTALL_BIN)/$(SNMPEXTENDER)
	rm -rf $(INSTALL_LUA)/$(LUAMODULE)

test:
	lua test.lua

testsnmp:
	$(SNMPEXTENDER) -l
	$(SNMPEXTENDER) -a

clean:
	rm -rf *~
