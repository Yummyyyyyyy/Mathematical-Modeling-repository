import numpy as np
import matplotlib.pyplot as plt

# m: predefined locations for light source
m= [[1,3,3],[4,1,5],[1,4,2],[1,5,3]]
# num: locations for receiving spots
num=[[i,j,0] for i in range(1,6) for j in range(1,6)]

# light source location visualization
x = [i[0] for i in m]
y = [i[1] for i in m]
z = [i[2] for i in m]
fig = plt.figure(figsize=(8,6))
ax = fig.add_subplot(121,projection = '3d')
ax.scatter(x, y, z,c='b',marker='*',s=100)
ax.set(xlabel="X", ylabel="Y", zlabel="Z")
plt.show()

# intensity: predefined intensity for each light source
intensity=[4,3,2,1]
# lightness: the overall illuminance we want
lightness=[]

# calculation of overall illuminance
for i in range (0,4):
    for j in range(0,25):
        distance=((m[i][0]-num[j][0])**2+(m[i][1]-num[j][1])**
                  2+(m[i][2]-num[j][2])**2)**0.5
        lightness.append(intensity[i]/distance**2) 
    print(sum(lightness))
lightness
