all: $(patsubst tex/%.tex, img/%.png, $(wildcard tex/*.tex))

.PHONY: clean

clean:
	rm -f img/*.png
	rm -f results/*.csv
	rm -f tex/*.pdf

results/iops-read-mach2.csv: results/*.json
	cd results; ./iops-csv.sh read mach2 >> $(patsubst results/%.csv, %.csv, $@)

results/iops-write-mach2.csv: results/*.json
	cd results; ./iops-csv.sh write mach2 >> $(patsubst results/%.csv, %.csv, $@)

results/iops-read-normal.csv: results/*.json
	cd results; ./iops-csv.sh read normal >> $(patsubst results/%.csv, %.csv, $@)

results/iops-write-normal.csv: results/*.json
	cd results; ./iops-csv.sh write normal >> $(patsubst results/%.csv, %.csv, $@)

img/%.png: tex/%.pdf
	convert -density 300 -units PixelsPerInch $< $@

tex/iops-read.pdf: tex/iops-read.tex results/iops-read-normal.csv results/iops-read-mach2.csv
	cd tex; pdflatex $(patsubst tex/%.tex, %.tex, $<)

tex/iops-write.pdf: tex/iops-write.tex results/iops-write-normal.csv results/iops-write-mach2.csv
	cd tex; pdflatex $(patsubst tex/%.tex, %.tex, $<)

tex/latency-write-1.pdf: tex/latency-write-1.tex results/write-normal-1.csv results/write-mach2-1.csv
	cd tex; pdflatex $(patsubst tex/%.tex, %.tex, $<)

tex/latency-write-64.pdf: tex/latency-write-64.tex results/write-normal-64.csv results/write-mach2-64.csv
	cd tex; pdflatex $(patsubst tex/%.tex, %.tex, $<)

tex/latency-read-1.pdf: tex/latency-read-1.tex results/read-normal-1.csv results/read-mach2-1.csv
	cd tex; pdflatex $(patsubst tex/%.tex, %.tex, $<)

tex/latency-read-64.pdf: tex/latency-read-64.tex results/read-normal-64.csv results/read-mach2-64.csv
	cd tex; pdflatex $(patsubst tex/%.tex, %.tex, $<)

results/%.csv: results/%.json
	cd results; latency-csv.sh $(patsubst results/%.json, %.json, $<) > $(patsubst results/%.csv, %.csv, $@)

