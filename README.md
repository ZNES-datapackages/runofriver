# Run of river data

This data set includes data from the `renpass` model.

## Datapackage creation

The datapackage has been created based on existing results. To get
the raw data do:

```bash
	git clone https://github.com/fraukewiese/renpass.git
```

Follow the instructions to setup the databases here: [Renpass MySQL setup](https://github.com/fraukewiese/renpass/blob/master/docs/manual_MySQL_R_installation_11_2014.pdf).

For this datapackage the `runofriver_register` has been exported to
`archive/runofriver_register.csv`. Data on Norwegian plants with `region_id = 19000` were excluded.

The final data and part of the meta-data has been created by running the following
from inside the datapackage root-directory:

```python
  python scripts/data-preparation.py
  python scripts/metadata-preparation.py
```

Additional metadata information has been added by hand.

## Additional information

* DENA made a grid region model, with the help of that, I clustered NUTS-3 Original region model:

German TSOs (2009). Regionenmodell Stromtransport 2013: Übersicht über die voraussichtliche Entwicklung der installierten Kraftwerksleistung und der Leistungsflüsse in den Netzgebieten der deutschen Übertragungsnetzbetreiber. German Transmission System Operators 2009: Amprion, EnBW, transpower, Vattenfall.
[Link](https://www.tennettso.de/site/binaries/content/assets/transparency/publications/grid-connection/regionenmodell_stromtransport_2013.pdf)

### Description to how the clustering was done:
See: 

Wiese, F.: renpass - Renewable Energy Pathways Simulation System - Open Source as an approach to meet challenges in energy 	modeling. PhD Thesis, Europa Universit¨at Flensburg (April 2015), p.68f. [PhD-Thesis](https://www.reiner-lemoine-stiftung.de/pdf/dissertationen/Dissertation_Frauke_Wiese.pdf)

The whole renpass model and database can be found here: https://github.com/fraukewiese/renpass

## Cite this 

Please do cite as:

Bökenkamp, Gesine, (2015). The Role of Norwegian Hydro Storage in Future Renewable Electricity Supply Systems in Germany: Analysis with a Simulation Model. PhD Thesis. Europa-Universität Flensburg, April 2015
[Thesis](https://www.zhb-flensburg.de/fileadmin/content/spezial-einrichtungen/zhb/dokumente/dissertationen/boekenkamp/dissertation-boekenkamp.pdf)

