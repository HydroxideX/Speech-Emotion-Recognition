f = open("Data.mat", "w")


def write(a):
    f.write("# Created by Octave 4.4.1, Sun Mar 22 15:17:52 2020 GMT <unknown@DESKTOP-1KJ1QHE>\n")
    f.write("# name: X\n")
    f.write("# type: matrix\n")
    f.write("# rows: %d\n", len(a))
    f.write("# columns: %d\n", len(a[0]))
    for i in range(len(a)):
        for j in range(len(a[0])):
            f.write(" ")
            f.write(str(a[i][j]))
        f.write("\n")
    f.close()
