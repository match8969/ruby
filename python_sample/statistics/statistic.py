import csv
import os, path
import math
import numpy as np
import matplotlib.pyplot as plt

"""


偏差積: deviation product
共分散:  covariance
相関係数: correlational coefficient
偏相関係数: partial correlational coefficient

"""

"""
X,Yの
偏相関係数 = (XとYの相関係数)-(XとZの相関係数)*(YとZの相関係数)^2 / (sqrt(1-(XとZの相関係数)))*(sqrt(1-(YとZの相関係数)))

"""


"""ファイル操作"""




"""合計・平均"""
def get_sum(array):
    sum = 0
    for a in array:
        sum += float(a)

    return sum

def get_avg(array):
    avg = 0
    count = len(array)

    sum = get_sum(array)
    avg = sum / count
    return avg


"""偏差"""
def get_diviation(x, avg_xs):
    diviation = x- avg_xs
    return diviation

"""標準偏差"""
def get_standard_deviation(array_deviatons):
    array_squared_deviations = [a*a for a in array_deviatons]
    standard_deviation = math.sqrt(sum(array_squared_deviations)/len(array_squared_deviations))
    return standard_deviation


"""偏差積"""
def get_deviation_seki(deviation_1, deviation_2):
    return deviation_1*deviation_2

"""共分散"""
def get_kyobunsan(array_deviation_seki):
    return sum(array_deviation_seki)/len(array_deviation_seki)


def get_soukan_keisuu(array_1, array_2):
    # lentgh
    if(len(array_1) != len(array_2)):
        print('Invalid. Check the array length')
        return
    lengh = len(array_1)
    avg_1 = sum(array_1)/lengh
    avg_2 = sum(array_2)/lengh

    list_deviation_1 = [a1 - avg_1 for a1 in array_1]
    list_deviation_2 = [a2 - avg_2 for a2 in array_2]

    standard_deviation_1 = math.sqrt(sum([d1*d1 for d1 in list_deviation_1])/lengh)
    standard_deviation_2 = math.sqrt(sum([d2*d2 for d2 in list_deviation_2])/lengh)

    kbsn = sum([d1*d2 for d1, d2 in zip(list_deviation_1, list_deviation_2)])/lengh
    soukan = kbsn/(standard_deviation_1*standard_deviation_2)
    return soukan


def get_correlation_coefficient(array_1, array_2):

    # lentgh
    if(len(array_1) != len(array_2)):
        print('Invalid. Check the array length')
        return
    lengh = len(array_1)
    avg_1 = sum(array_1)/lengh
    avg_2 = sum(array_2)/lengh

    list_deviation_1 = [a1 - avg_1 for a1 in array_1]
    list_deviation_2 = [a2 - avg_2 for a2 in array_2]

    standard_deviation_1 = math.sqrt(sum([d1*d1 for d1 in list_deviation_1])/lengh)
    standard_deviation_2 = math.sqrt(sum([d2*d2 for d2 in list_deviation_2])/lengh)

    kbsn = sum([d1*d2 for d1, d2 in zip(list_deviation_1, list_deviation_2)])/lengh
    soukan = kbsn/(standard_deviation_1*standard_deviation_2)
    return soukan


def get_partial_correlation_coefficient(cc_xy, cc_xz, cc_yz):

    partial_correlation_coefficient = cc_xz-(cc_xy)*(cc_yz)/math.sqrt(1-(cc_xz)*(cc_xz))*math.sqrt(1-(cc_yz))
    return partial_correlation_coefficient


# TODO: test
array_x = [1, 3, 3, 4, 5, 5, 5, 6, 8, 10]  # bank count
array_y = [30, 61, 80, 120, 130, 120, 133, 140, 160, 199]  # restaurant count
array_z = [1200, 3000, 3200, 4000, 5000, 6000, 7000, 8000, 9000, 10000]  # population

cc_xy = get_correlation_coefficient(array_x, array_y)
cc_xz = get_correlation_coefficient(array_x, array_z)
cc_yz = get_correlation_coefficient(array_y, array_z)

print('cc_xy=', cc_xy)
print('cc_xz=', cc_xz)
print('cc_yz=', cc_yz)


pcc_xy = get_partial_correlation_coefficient(cc_xy, cc_xz, cc_yz)
print('pcc_xy=', pcc_xy)


if pcc_xy <= -0.95:
    print('pcc_xy has strong Negative relation!')
elif pcc_xy >= 0.95:
    print('pcc_xy has strong Positive relation!')
else:
    print('pcc_xy has no strong relation becuase pcc_xy=', pcc_xy)
