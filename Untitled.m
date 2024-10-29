x = [1:1000]
x2 = [1:156]
y = [1:1000]
x = x'
r2 = audioread('Audio1.wav')
r3 = r2(:, 1)
r4 = r3(1:156)
r4 = r4'

z = [0 1 1 2 3]