
reports = report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
RMDFILE = report/report

all: report.pdf eda-output.txt regression.RData


data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

clean:
	rm report/report.pdf

report.pdf: $(reports)
	Rscript -e "require(knitr); require(markdown); knit('$(RMDFILE).rmd', '$(RMDFILE).md'); markdownToHTML('$(RMDFILE).md', '$(RMDFILE).html', options=c('use_xhml'))"
	pandoc -s $(RMDFILE).html -o report/report.html

regression.Rdata: code/regression-script.R data/Advertising.csv
	cd code && Rscript regression-script.R

eda-output.txt: code/eda-script.R data/Advertising.csv
	cd code && Rscript eda-script.R

