all: rp-f rp-a rp-c

rpm-f: rpmulti.f95
	gfortran -fcheck=all rpmulti.f95 -o rpmulti-f

rpm-a: rpmulti.adb
	gnatmake rpmulti.adb -o rpmulti-a

rpm-c: rpmulti.c
	gcc -Wall --std=c11 rpmulti.c -o rpmulti-c

.PHONY: clean
clean:
	rm -rfv rpmulti-f rpmulti-a rpmulti-c rpmulti.o rpmulti.ali
