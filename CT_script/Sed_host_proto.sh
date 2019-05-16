#!/bin/bash

# author : Francois Gardavaud
# version date : 14-05-2019
# purpose : script to change distant host in 750HD or Revo GSI by using system state file
# Tutorial : Save the system state (only protocol selection work). Put it on a path (here on the desktop).
# prerequisites: put the script 4lines.bash in the same directory
# excute the script. Enjoy it


# Path containing the protocoles files
cd /Users/francoisgardavaud/Desktop/service_mod_data/system_state/


##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF ABDOMINAL PROTOCOLS  ####################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in abdomen_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file

# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file


sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file

done
echo "processing of abdomen.proto files finished"


##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF CHEST PROTOCOLS #########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in chest_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file

# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file

done
echo "processing of chest.proto files finished"

##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF HEAD PROTOCOLS ##########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in head_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file

# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file


done
echo "processing of head.proto files finished"



##############################################################################################################################
##############################################################################################################################
##############################################################################################################################
######### /!\/!\/!\/!\LOWER PROTOCOL FILES NOT SUPPORTED BECAUSE RECON REQUIRED FOR AMI VIA ADW IN MY CASE /!\/!\/!\##########
##############################################################################################################################
##############################################################################################################################
##############################################################################################################################
##############################################################################################################################


##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF MISC PROTOCOLS ##########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in misc_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file

# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file

done
echo "processing of misc.proto files finished"

##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF NECK PROTOCOLS ##########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in neck_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file


# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file


done
echo "processing of neck.proto files finished"

##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF ORBIT PROTOCOLS #########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in orbit_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file

# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file


done
echo "processing of orbit.proto files finished"


##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF PELVIS PROTOCOLS ########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in pelvis_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file


# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file


done
echo "processing of pelvis.proto files finished"


##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF SPINE PROTOCOLS #########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in spine_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file

# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file


done
echo "processing of spine.proto files finished"

##############################################################################################################################
##############################################################################################################################
####################################### TREATMENT OF UPPER PROTOCOLS #########################################################
##############################################################################################################################
##############################################################################################################################

#  loop on all protocol files of the abdomen type
for file in upper_*.proto
do
echo "Process on $file ..."

# allows you to make character replacements in proto files
# Here, the field "ADW7" will be transformed into the field "AWS"
LC_ALL=C sed -i '' 's/"ADW7"/"AWS"/g' $file
# additional replacement shares added
LC_ALL=C sed -i '' 's/"ADW8"/"AWS"/g' $file
LC_ALL=C sed -i '' 's/"Mac_DW"/""/g' $file
LC_ALL=C sed -i '' 's/"WFM2"/""/g' $file

# we make sure we have the right remote hosts for the SR and DR (slot 1 and 2 for AWS and PACS)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = ""/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination1 = ""/drSeriesAutoTransferDestination1 = "AWS"/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination2 = ""/drSeriesAutoTransferDestination2 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination1 = "AWS"/srSeriesAutoTransferDestination1 = "PACS"/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination2 = "PACS"/srSeriesAutoTransferDestination2 = "AWS"/g' $file

# delete the other remote hosts for SR and DR (slot 3 and 4)
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "PACS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "PACS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "PACS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "PACS"/drSeriesAutoTransferDestination4 = ""/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination3 = "AWS"/srSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferDestination4 = "AWS"/srSeriesAutoTransferDestination4 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination3 = "AWS"/drSeriesAutoTransferDestination3 = ""/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferDestination4 = "AWS"/drSeriesAutoTransferDestination4 = ""/g' $file


# we make sure we have only two active transfer slots for the SR and DR

LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 0/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 1/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 3/drSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/drSeriesAutoTransferNumberOfDestinations = 4/drSeriesAutoTransferNumberOfDestinations = 2/g' $file

LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 0/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 1/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 3/srSeriesAutoTransferNumberOfDestinations = 2/g' $file
LC_ALL=C sed -i '' 's/srSeriesAutoTransferNumberOfDestinations = 4/srSeriesAutoTransferNumberOfDestinations = 2/g' $file

# we make sure we don't have remain old host in transfert by series
# for serie number 1
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw1"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "adw2"/autoTransferDestination1S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S1 = "aws"/autoTransferDestination1S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw1"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "adw2"/autoTransferDestination2S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S1 = "aws"/autoTransferDestination2S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw1"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "adw2"/autoTransferDestination3S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S1 = "aws"/autoTransferDestination3S1 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw1"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "adw2"/autoTransferDestination4S1 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S1 = "aws"/autoTransferDestination4S1 = ""/g' $file

# for serie number 2
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw1"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "adw2"/autoTransferDestination1S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S2 = "aws"/autoTransferDestination1S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw1"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "adw2"/autoTransferDestination2S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S2 = "aws"/autoTransferDestination2S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw1"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "adw2"/autoTransferDestination3S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S2 = "aws"/autoTransferDestination3S2 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw1"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "adw2"/autoTransferDestination4S2 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S2 = "aws"/autoTransferDestination4S2 = ""/g' $file

# for serie number 3
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw1"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "adw2"/autoTransferDestination1S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S3 = "aws"/autoTransferDestination1S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw1"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "adw2"/autoTransferDestination2S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S3 = "aws"/autoTransferDestination2S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw1"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "adw2"/autoTransferDestination3S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S3 = "aws"/autoTransferDestination3S3 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw1"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "adw2"/autoTransferDestination4S3 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S3 = "aws"/autoTransferDestination4S3 = ""/g' $file

# for serie number 4
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw1"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "adw2"/autoTransferDestination1S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination1S4 = "aws"/autoTransferDestination1S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw1"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "adw2"/autoTransferDestination2S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination2S4 = "aws"/autoTransferDestination2S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw1"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "adw2"/autoTransferDestination3S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination3S4 = "aws"/autoTransferDestination3S4 = ""/g' $file

LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw1"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "adw2"/autoTransferDestination4S4 = ""/g' $file
LC_ALL=C sed -i '' 's/autoTransferDestination4S4 = "aws"/autoTransferDestination4S4 = ""/g' $file

sh 4lines.bash <$file> tmpfile_$file   # "4lines.bash" is a script to eliminate the following structure to avoid duplicate image sendingto the same host
# the structure is in my case :
#AutoXferHostInfo {
#autoXferHostName = "AWS"
#autoXferMode = 1
#}
mv tmpfile_$file $file

done
echo "processing of upper.proto files finished"
