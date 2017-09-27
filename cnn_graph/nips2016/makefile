NB = $(sort $(wildcard *.ipynb))

run: $(NB)

$(NB):
	jupyter-3.5 nbconvert --inplace --execute --ExecutePreprocessor.timeout=-1 $@

clean:
	jupyter-3.5 nbconvert --inplace --ClearOutputPreprocessor.enabled=True $(NB)

.PHONY: run $(NB) clean
