# -*- coding: utf-8 -*-
import pandas as pd
import os

# load, manipulate and store data
df = pd.read_csv('archive/runofriver_register.csv')

df = df.dropna(axis=0, how='all')

if not os.path.exists('data'):
    os.makedirs('data')

df.to_csv('data/runofriver.csv', index=False)
