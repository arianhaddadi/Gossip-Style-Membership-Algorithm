
CFLAGS =  -g -std=c++11
BUILD_DIR = build
SRC_DIR = src
LOGS_DIR = logs

all: Application

Application: $(BUILD_DIR)/MP1Node.o $(BUILD_DIR)/EmulNet.o $(BUILD_DIR)/Application.o $(BUILD_DIR)/Log.o $(BUILD_DIR)/Params.o $(BUILD_DIR)/Member.o
	g++ -o Application $(BUILD_DIR)/MP1Node.o $(BUILD_DIR)/EmulNet.o $(BUILD_DIR)/Application.o $(BUILD_DIR)/Log.o $(BUILD_DIR)/Params.o $(BUILD_DIR)/Member.o ${CFLAGS}

$(BUILD_DIR)/MP1Node.o: $(SRC_DIR)/MP1Node.cpp $(SRC_DIR)/MP1Node.h $(SRC_DIR)/Log.h $(SRC_DIR)/Params.h $(SRC_DIR)/Member.h $(SRC_DIR)/EmulNet.h $(SRC_DIR)/Queue.h
	g++ -c $(SRC_DIR)/MP1Node.cpp ${CFLAGS} -o $(BUILD_DIR)/MP1Node.o

$(BUILD_DIR)/EmulNet.o: $(SRC_DIR)/EmulNet.cpp $(SRC_DIR)/EmulNet.h $(SRC_DIR)/Params.h $(SRC_DIR)/Member.h
	g++ -c $(SRC_DIR)/EmulNet.cpp ${CFLAGS} -o $(BUILD_DIR)/EmulNet.o

$(BUILD_DIR)/Application.o: $(SRC_DIR)/Application.cpp $(SRC_DIR)/Application.h $(SRC_DIR)/Member.h $(SRC_DIR)/Log.h $(SRC_DIR)/Params.h $(SRC_DIR)/Member.h $(SRC_DIR)/EmulNet.h $(SRC_DIR)/Queue.h
	g++ -c $(SRC_DIR)/Application.cpp ${CFLAGS} -o $(BUILD_DIR)/Application.o

$(BUILD_DIR)/Log.o: $(SRC_DIR)/Log.cpp $(SRC_DIR)/Log.h $(SRC_DIR)/Params.h $(SRC_DIR)/Member.h
	g++ -c $(SRC_DIR)/Log.cpp ${CFLAGS} -o $(BUILD_DIR)/Log.o

$(BUILD_DIR)/Params.o: $(SRC_DIR)/Params.cpp $(SRC_DIR)/Params.h
	g++ -c $(SRC_DIR)/Params.cpp ${CFLAGS} -o $(BUILD_DIR)/Params.o

$(BUILD_DIR)/Member.o: $(SRC_DIR)/Member.cpp $(SRC_DIR)/Member.h
	g++ -c $(SRC_DIR)/Member.cpp ${CFLAGS} -o $(BUILD_DIR)/Member.o

clean:
	rm -rf $(BUILD_DIR)/*.o Application $(LOGS_DIR)/*.log
