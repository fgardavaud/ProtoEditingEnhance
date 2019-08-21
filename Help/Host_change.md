# How to change host in command line

Retrieve proto files locally on your computed by doing a *save state* operation or connect remotely to the scanner thanks telnet or ssh method if you have acces to root password.

On **Mac** only, open a terminal, go to the path of .proto file, and enter the following command:
```
sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' /Users/francoisgardavaud/Desktop/service_mod_data/system_state/abdomen_*.proto
```
*on other operating systems you must adapt the sed command to your platform*


The "" field will change to "AWS" fields

If the command does not work on some files, it is certainly an ASCII encoding problem. One solution is to use this command line
```
**LC_ALL=C** sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' /Users/francoisgardavaud/Desktop/service_mod_data/system_state/abdomen_*.proto
```
**Warning: files will be re-encoded and out-of-system characters (such as accents) will no longer be reckoned.

Another solution is to ignore the encoding problem by the following command line:
```
**LC_CTYPE=C** sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' /Users/francoisgardavaud/Desktop/service_mod_data/system_state/abdomen_*.proto
```

----

Be carreful with great power come great responsability !

