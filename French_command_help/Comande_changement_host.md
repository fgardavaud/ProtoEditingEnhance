# Some tricks


## Remote host change command Scanner

Retrieve proto files locally or connect remotely to the scanner


On the scanner proceed as follows:


On **Mac** only, open a terminal and enter the following command:
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

