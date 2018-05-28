# -*- coding: utf-8 -*-
from datapackage import Resource, Package

# metadata mapper from original database table description
description_mapper = {
  'ror_nr': 'id',
  'ror_unit': 'Name of the unit',
  'ror_plant': 'Name of the plant',
  'region_id': None,
  'zip': 'zip code of the location',
  'city': None,
  'street': None,
  'year': 'year of installation',
  'Pinst': 'installed capacity in MW',
  'efactor': 'energy that can be gained from the water kwh/m3',
  'head': 'difference in altitude in m',
  'total_flow': 'inflow to the power plant in mio m3',
  'flo_river_ror': 'next downstream res_nr',
  'status': 'operational status of the plant',
  'company': None,
  'turbtype': 'optional: turbine type',
  'geodbid':  'specified id for geo referencing',
  'river': 'river in which the plant is located',
  'river_km': 'km from stream source',
  'level_meter': 'assigned level meter for flow curve'}

# create resource
r = Resource({'path': 'data/runofriver.csv'})

# get basic metadata from data
r.infer()

# add description for fields based on mapper
for i in range(len(r.descriptor['schema']['fields'])):
    r.descriptor['schema']['fields'][i]['description'] = \
        description_mapper[r.descriptor['schema']['fields'][i]['name']]

# commit (apply) changes to resource
r.commit()

# save the resource
r.save('dataresource.json')

# create a package
p = Package()

# add the resource descriptor
p.add_resource(r.descriptor)

# save the package
p.save('datapackage.json')
