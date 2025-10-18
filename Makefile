# If you move this project you can change the directory
# to match your GBDK root directory (ex: GBDK_HOME = "C:/GBDK/"
ifndef GBDK_HOME
	GBDK_HOME = /opt/gbdk/
endif

LCC   = $(GBDK_HOME)bin/lcc -Wa-l -Wl-m -Wl-j
OUT   = Output

BINS  = $(OUT)/game.gb

# GBDK_DEBUG = ON
ifdef GBDK_DEBUG
	LCCFLAGS += -debug -v
endif

# Recursively find all .c files under the current directory and subdirectories
SRCS := $(shell find . -name '*.c')
OBJS := $(patsubst ./%.c,$(OUT)/%.o,$(SRCS))

# Default rule
all: $(BINS)

# Compile .c → .o into Output/
$(OUT)/%.o: %.c
	@mkdir -p $(dir $@)
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Link all object files → game.gb inside Output/
$(BINS): $(OBJS)
	@mkdir -p $(OUT)
	$(LCC) $(LCCFLAGS) -o $@ $^

# Clean wipes everything in Output/
clean:
	rm -rf $(OUT)

# Run the game with Emulicious
run: $(BINS)
	java -jar ../Emulicious/Emulicious.jar $(BINS) 2>/dev/null
