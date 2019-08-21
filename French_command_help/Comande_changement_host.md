# pour mes compatriotes français


## Commande changement hôte distant Scanner

Récupérer les fichiers proto en local ou se connecter à distance sur le scanner


Sur le scanner procéder comme suit :


Sur **Mac** seulement, ouvrir un terminal et rentrer la commande suivante :
```
sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' /Users/francoisgardavaud/Desktop/service_mod_data/system_state/abdomen_*.proto
```
*sur les autres systèmes d'exploitation vous devez adapté la commande sed à votre plateforme*


Le champs "" se transformera en champs "AWS"

Si la commande ne fonctionne pas sur certains fichiers il s'agit certainement d'un problème d'encodage ASCII. Une solution consiste à utiliser cette ligne de commande
```
**LC_ALL=C** sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' /Users/francoisgardavaud/Desktop/service_mod_data/system_state/abdomen_*.proto
```
**Attention : les fichiers seront réencodés et les caractères hors système (comme les accents) ne seront plus ris en compte.**

Une autre solution consiste à ignorer le problème d'encodage par la ligne de commande suivante :
```
**LC_CTYPE=C** sed -i '' 's/srSeriesAutoTransferDestination2 = ""/srSeriesAutoTransferDestination2 = "AWS"/g' /Users/francoisgardavaud/Desktop/service_mod_data/system_state/abdomen_*.proto
```

