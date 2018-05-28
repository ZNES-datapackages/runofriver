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

## Cite this package

Please do cite the original data source in addition to this one!  
