all: myexe
	make doczip
clean:
	-rm *.o
	-rm .class
	-rm myexe
	-rm html
	-rm latex
myexe: course.o collegemain.o college.o
	g++ -o myexe course.o collegemain.o college.o
course.o: course.cc course.h
	g++ -c course.cc
collegemain.o: collegemain.cc course.h node.h college.h
	g++ -c collegemain.cc
college.o: college.cc college.h
	g++ -c college.cc
doc:
	doxygen Doxyfile	
doczip: doczip.tgz
doczip.tgz: makefile course.cc course.o course.h collegemain.o collegemain.cc college.o college.cc college.h node.h tarray.h
	cd /Users/emilycaggiano/Downloads/Quiz2 
	tar cvf doczip.tar *
	gzip doczip.tar
	
