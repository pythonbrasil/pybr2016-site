JS_FILES=$(shell find js-src -name "*.js")
SASS_FILES=$(shell find sass/ -name "*.scss")

all: css js
css: static/css/main.css static/css/main.css.map
static/css/%.css: $(SASS_FILES)
	[ -d static/css ] || mkdir -p static/css
	sass sass/main.scss static/css/main.css

js: static/js/main.js
static/js/main.js: $(JS_FILES)
	gulp

clean:
	rm -rf static/js
	rm -rf static/css

.PHONY: all css js clean
