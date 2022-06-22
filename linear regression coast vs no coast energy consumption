#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun 22 12:08:39 2022

@author: indu
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import statsmodels.formula.api as smf
us = pd.read_csv("file:///home/indu/Downloads/Energy Census and Economic Data US 2010-2014.csv")
us1 = us[["State", "Coast", "TotalP2014", "TotalC2014"]]
us2 = us1.drop([51])
print(us2)
plt.plot("TotalP2014", "TotalC2014", data=us2, linestyle = "none", marker="o", alpha=.3)
plt.xlabel("Energy Production 2014")
plt.ylabel("Energy Consumption 2014")
results = smf.ols("TotalC2014 ~ TotalP2014 + Coast", data=us2).fit()
print(results.params)

df= pd.DataFrame()
df["TotalC2014"] = np.linspace(0, 6000000)
df["TotalP2014"] = np.linspace(0, 70000000)

df["Coast"] = 0
pred1 = results.predict(df)

df["Coast"] = 1
pred2 = results.predict(df)

plt.clf()

plt.plot(df['TotalC2014'], pred1, label='No Coast')
plt.plot(df["TotalC2014"], pred2, label="Coast")
plt.xlabel('TotalP2014')
plt.ylabel('TotalC2014')
plt.legend()
plt.show()