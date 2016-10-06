
reports = report/report.Rmd images/scatterplot-tv-sales.png data/regression.RData 
RMDFILE = report/report

all: report.pdf eda-output.txt regression.RData


data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

clean:
	rm report/report.pdf

#report.pdf: $(reports)
#	cd report && Rscript -e "require(knitr); require(rmarkdown); render('report.Rmd', output_file = 'report.pdf')"

report.pdf: $(reports)
	cd report && Rscript -e "require(knitr); require(rmarkdown); require(xtable); render('report.Rmd', 'pdf_document')


regression.Rdata: code/regression-script.R data/Advertising.csv
	cd code && Rscript regression-script.R

eda-output.txt: code/eda-script.R data/Advertising.csv
	cd code && Rscript eda-script.R

