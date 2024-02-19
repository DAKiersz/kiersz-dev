.PHONY: src

SRC_DIR = ./src
CV_SRCS = $(shell find $(SRC_DIR) -name '*.tex')

kiersz-cv.pdf: $(SRC_DIR)/kiersz-cv.tex $(CV_SRCS)
	xelatex -output-directory=$(SRC_DIR) $<

kiersz-cover.pdf: $(SRC_DIR)/kiersz-cover.tex $(CV_SRCS)
	xelatex -output-directory=$(SRC_DIR) $<

clean:
	rm -rf $(SRC_DIR)/*