GENERATED_FILES = \
	d3-selection-multi.js \
	d3-selection-multi.min.js

all: $(GENERATED_FILES)

.PHONY: clean all test publish

test:
	node_modules/.bin/vows

d3-selection-multi.js: $(shell node_modules/.bin/browserify standalone.js --list)
	rm -f $@
	node_modules/.bin/browserify standalone.js > $@
	chmod a-w $@

d3-selection-multi.min.js: d3-selection-multi.js
	rm -f $@
	node_modules/.bin/uglifyjs $^ -c -m -o $@
	chmod a-w $@

publish:
	npm publish

clean:
	rm -f -- $(GENERATED_FILES)
