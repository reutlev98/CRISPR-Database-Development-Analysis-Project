import pandas as pd
import os
import numpy as np


def comper(bed1, bed2, output, x='', y='', header=True):
    csv1 = pd.read_csv(bed1, sep='\t')
    csv2 = pd.read_csv(bed2, sep='\t')

    merged = pd.merge(csv1, csv2, on='#BED_Chromosome', how="outer")

    # check for overlap
    merged['overlap'] = (((merged['BED_Max.Position_x'] >= merged['BED_Min.Position_y']) & (
            merged['BED_Min.Position_x'] <= merged['BED_Min.Position_y'])) |
                         ((merged['BED_Max.Position_y'] >= merged['BED_Min.Position_x']) & (
                                 merged['BED_Min.Position_y'] <= merged['BED_Min.Position_x'])))

    diff = merged.loc[merged['overlap'] == False]
    notdiff = merged.loc[merged['overlap'] == True]


    for index, row in diff.iterrows():
        if (len(notdiff.loc[(notdiff['#BED_Chromosome'] == row['#BED_Chromosome']) & (
                notdiff['BED_Min.Position_y'] == row['BED_Min.Position_y'])].values)):
            diff = diff.drop(index=index)


    columns = diff.columns.values

    for i in range(len(columns)):
        if '_x' in columns[i] or '_y' in columns[i]:
            columns[i] = (columns[i]).replace('_x', x)
            columns[i] = columns[i].replace('_y', y)

    # save the information
    diff.to_csv(output, mode='a', index=False, sep='\t', header=header)


if __name__ == "__main__":
    x = '04'
    y = '06'

    output = x + "_" + y
    # assign directory
    directory1 = 'bedformat-' + x
    directory2 = 'bedformat-' + y

    first = True
    # iterate over files in
    # that directory
    for filename1 in os.listdir(directory1):
        path1 = os.path.join(directory1, filename1)
        path2 = os.path.join(directory2, filename1.replace(x, y))
        comper(path1, path2, output, x=x, y=y, header=first)
        first = False

# path9 = "bedformat-09/ATM-ATG-D1_identifiedOfftargets09.txt_bed"
