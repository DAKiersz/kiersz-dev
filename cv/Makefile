.PHONY: src

SRC_DIR = src
CV_DIR = src/cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

kiersz-cv.pdf: $(SRC_DIR)/kiersz-cv.tex $(CV_SRCS)
	xelatex -output-directory=$(SRC_DIR) $<

clean:
	rm -rf $(SRC_DIR)/* /out/*