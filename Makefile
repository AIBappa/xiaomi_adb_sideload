OUT := xiaomi_adb

CFLAGS=-O2 -Wall -g -D_FILE_OFFSET_BITS=64 -I./lib $(shell pkg-config --cflags libusb-1.0 libcurl)
LDFLAGS := `pkg-config --libs libusb-1.0`
prefix := /usr/local

SRCS := main.c lib/AES/aes.c lib/BASE64/base64.c lib/JSON/tiny-json.c lib/MD5/md5.c 
OBJS := $(SRCS:.c=.o)

default: $(OUT)

$(OUT): $(OBJS)
	cc -o xiaomi_adb main.o lib/AES/aes.o lib/BASE64/base64.o lib/JSON/tiny-json.o lib/MD5/md5.o $(shell pkg-config --libs libusb-1.0 libcurl)

clean:
	rm -f $(OUT) $(OBJS)