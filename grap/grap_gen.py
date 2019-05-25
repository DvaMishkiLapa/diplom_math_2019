# -*- coding: utf-8 -*-

import math

import matplotlib.pyplot as plt
import numpy as np


def impulse():
    x = [x * 0.0005 for x in range(-int(math.pi / 0.0005), int(math.pi / 0.0005))]
    y = []
    count = 3

    for X in x:
        summa = []
        for j in range(0, count):
            summa.append((count - j) / count * math.cos((j + 1) * X))
        y.append(sum(summa))
        summa.clear()

    plt.figure(figsize=(5.8, 3.0))
    plt.plot(x, y, linewidth=2)
    plt.grid()

    plt.savefig('./grap/impulse.pdf')
    # plt.savefig('./grap/impulse.pgf')


impulse()
