SWIG = swig
PREFIX = kama

all: cpp python install

clean:
	rm lib build *.cxx -rf
	rm $(PREFIX).py $(PREFIX) -rf
	
python:	
	$(SWIG) -Wall -python -shadow -c++ $(PREFIX).i
	python setup.py build
	
cpp:
	gcc -Wall -ggdb -o $(PREFIX) $(PREFIX).cpp -lmecab -lstdc++ -I.

install:
	python setup.py install --prefix=.
	
