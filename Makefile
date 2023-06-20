.PHONY: render clean

render:
	@quarto render .

clean:
	@rm -rf docs
