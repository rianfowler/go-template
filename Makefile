# Binary name for your project; adjust as needed.
BINARY_NAME = myapp

.PHONY: all
all: build

.PHONY: build
build:
	go build -o $(BINARY_NAME) .

.PHONY: run
run: build
	./$(BINARY_NAME)

.PHONY: test
test:
	go test -v ./...

.PHONY: t
t:
	gotestsum --format short-verbose ./...

.PHONY: clean
clean:
	go clean
	rm -f $(BINARY_NAME)

.PHONY: watch-run
watch-run:
	reflex --decoration=none -r '\.go$$' -s -- sh -c "make run"

.PHONY: watch-test
watch-test:
	reflex --decoration=none -r '\.go$$' -s -- sh -c "make t"

.PHONY: watch
watch:
	# Create a new tmux session named "watch_session" in detached mode.
	tmux new-session -d -s watch_session "tmux set-option -g mouse on; make watch-test" \
		\; split-window -h "make watch-run" \
		\; attach-session

.PHONY: watch-kill
watch-kill:
	tmux kill-session -t watch_session

