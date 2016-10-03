
all: report.pdf eda-output.txt regression.RData


data.csv:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

clean:
	rm report/report.pdf

report.pdf: report.Rmd regression.RData scatterplot-tv-sales.png
	#add commands here

regression.Rdata: regression-script.R Advertising.csv
	#add commands here

eda-output.txt: eda-script.R Advertising.csv
	#add commands here